//
//  UserTableViewCell.swift
//  QulixTest
//
//  Created by Женя  on 6.02.22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func setup(with user: User) {
        self.userID.text = String(user.userID)
        self.title.text = user.title
    }
    
    
}
