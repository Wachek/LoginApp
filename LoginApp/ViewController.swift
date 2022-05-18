//
//  ViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 14.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed() {
        
        textFormatCheck(for: userNameTextField.text)
        textFormatCheck(for: passwordTextField.text)
        
        guard userNameTextField.text == "User" else {
            showAlert(with: "Wrong user name or password", and: "Please, enter correct user name and password")
            return
        }
        
        guard passwordTextField.text == "Password" else {
            showAlert(with: "Wrong user name or password", and: "Please, enter correct user name and password")
            return
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(with: "Uuups!", and: "Your user name is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Uuups!", and: "Your password is Password")
    }
    
}

extension ViewController {
    
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let returnAction = UIAlertAction(title: "Return", style: .cancel) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(returnAction)
        present(alert, animated: true)
    }
    
    private func textFormatCheck (for text: String?) {
        guard let inputText = text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please, enter user name and password")
            return
        }
    }
}
