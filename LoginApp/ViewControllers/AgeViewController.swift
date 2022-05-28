//
//  AgeViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 28.05.2022.
//

import UIKit

class AgeViewController: UIViewController {

    @IBOutlet var ageLabel: UILabel!
    
    var userAge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageLabel.text = "My age is \(userAge)"
    }
}
