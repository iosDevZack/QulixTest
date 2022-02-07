//
//  DescriptionViewController.swift
//  QulixTest
//
//  Created by Женя  on 6.02.22.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    //MARK: - Property
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var body: String = ""
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = body
    }
    
}
