//
//  ContactsViewController.swift
//  ContactEdit
//
//  Created by Esync on 19/02/2023.
//

import UIKit

class ContactsViewController: UIViewController,UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    


    @IBOutlet weak var collectionView: UICollectionView!


    var detailtosend: ContactModel?

    
    private let sectionInsets = UIEdgeInsets(
          top: 0.0,
          left: 20.0,
          bottom: 0.0,
          right: 20.0)
        
        private let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.reloadData()
    }

    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("data.json")
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
            
            print(contactList)
           
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            
            if contactList.isEmpty{
                decodeData(pathName: mainPath)
            }
            
        }else{
            decodeData(pathName: mainPath)
        }
        
        self.collectionView.reloadData()
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            contactList = try decoder.decode([ContactModel].self, from: jsonData)
        } catch {}
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCollectionViewCell", for: indexPath) as! ContactCollectionViewCell
       
        let contact = contactList[indexPath.row]
        cell.roundView.layer.cornerRadius = cell.roundView.frame.height / 2
        cell.nameLabel.text = contact.firstName + " " + contact.lastName
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactList.count
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailtosend = contactList[indexPath.row]
        currentIndex = indexPath.row
        self.performSegue(withIdentifier: "showDetailsContacts", sender:detailtosend)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
       let availableWidth = view.frame.width - paddingSpace
       let widthPerItem = availableWidth / itemsPerRow
                    
       return CGSize(width: widthPerItem, height:150)

    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      
      return sectionInsets
      
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          
      return 0
       
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            
               
          return sectionInsets.left
      
    }
}
