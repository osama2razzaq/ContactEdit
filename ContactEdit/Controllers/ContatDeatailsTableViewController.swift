//
//  ContatDeatailsTableViewController.swift
//  ContactEdit
//
//  Created by Esync on 19/02/2023.
//

import UIKit

class ContatDeatailsTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate{

    @IBOutlet weak var detailsTableView: UITableView!

    var textChanged: ((String?) -> Void)?
    
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var dob: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        detailsTableView.dataSource = self
        detailsTableView.delegate = self

    }
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(contactList)
            try JsonData.write(to: location)
           
            self.navigationController?.popViewController(animated: true)
        }catch{}
    }
    

    // MARK: - Table view data source
    @IBAction func cancelButtonPresed(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savedButtompressed(_ sender: UIBarButtonItem) {
        tappedSaveButton()

        }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return 3
    }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: "top") as! TopTableViewCell
            cell.roundView.layer.cornerRadius = cell.roundView.layer.frame.height / 2
           
                   return cell
               }
               else if indexPath.row == 1 {
                   let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: "main") as! MainInformationTableViewCell
                 
                   cell.firstNameTextField.text = contactList[currentIndex].firstName
                   cell.lastNameTextField.text = contactList[currentIndex].lastName
                   firstName = cell.firstNameTextField.text!
                   lastName = cell.lastNameTextField.text!
                   
                   cell.firstNameTextField.tag = indexPath.row
                   cell.lastNameTextField.tag = indexPath.row
                   
                   print(lastName)
                   return cell
               }
               else {
                   let cell = self.detailsTableView.dequeueReusableCell(withIdentifier: "sub") as! SubInformationTableViewCell

                   cell.emailTextfield.text = contactList[currentIndex].email
                   cell.dobTextfield.text = contactList[currentIndex].dob
                   email = cell.emailTextfield.text!
                   dob = cell.dobTextfield.text!

                   return cell
               }
         

       
    }
    func changeValue() {
        for rowIndex in 0..<detailsTableView.numberOfRows(inSection: 0) {
            let indexPath = IndexPath(row: rowIndex, section: 0)
            if let maininfoCell = detailsTableView.cellForRow(at: indexPath) as? MainInformationTableViewCell {
                print(maininfoCell.firstNameTextField.text!)
                print(maininfoCell.lastNameTextField.text!)
                
                firstName = maininfoCell.firstNameTextField.text!
                lastName = maininfoCell.lastNameTextField.text!
               
            }else  if let maininfoCell = detailsTableView.cellForRow(at: indexPath) as? SubInformationTableViewCell {
                email = maininfoCell.emailTextfield.text!
                dob = maininfoCell.dobTextfield.text!
              
            }
            
        }
    }
  
@objc func tappedSaveButton() {
    changeValue()
   
    contactList[currentIndex].firstName = firstName
    contactList[currentIndex].lastName = lastName
    contactList[currentIndex].email = email
    contactList[currentIndex].dob = dob
    
    
    writeToFile(location: subUrl!)
   

    }
    

   

}
