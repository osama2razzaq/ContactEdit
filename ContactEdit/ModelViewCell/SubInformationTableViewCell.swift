//
//  SubInformationTableViewCell.swift
//  ContactEdit
//
//  Created by Esync on 19/02/2023.
//

import UIKit

class SubInformationTableViewCell: UITableViewCell {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var dobTextfield: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
