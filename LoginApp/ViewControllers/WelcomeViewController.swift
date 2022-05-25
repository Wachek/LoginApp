//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 19.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user)!"
    }
    
}

// welcomeVC.welcomeText = "Welcome, \(userNameTextField.text ?? "")!"
