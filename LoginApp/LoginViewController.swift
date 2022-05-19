//
//  ViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 14.05.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.welcomeText = "Welcome, \(userNameTextField.text ?? "")!"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        return true
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
        showAlert(with: "Oops!", and: "Your user name is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Oops!", and: "Your password is Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
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
