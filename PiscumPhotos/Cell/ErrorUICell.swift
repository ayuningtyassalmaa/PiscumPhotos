//
//  ErrorUICell.swift
//  PiscumPhotos
//
//  Created by Salma Ayuningtyas on 10/17/25.
//

import UIKit

class ErrorUICell: UITableViewCell {
    
    static let identifier = "ErrorUICell"
    
    
    @IBOutlet weak var errorUI: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
