//
//  ViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 14.05.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.createUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        if let viewControllers = tabBarController.viewControllers {
            for viewController in viewControllers {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.user = user.person.name
                } else if let navigationVC = viewController as? UINavigationController {
                    if let profileVC = navigationVC.topViewController as? MyProfileVC {
                        profileVC.userName = user.person.name
                        profileVC.userLastname = user.person.lastname
                        profileVC.age = user.person.age
                        profileVC.hobbies = user.person.hobbies
                    }
//                    else {
//                        for viewController in navigationVC.viewControllers {
//                            if let ageVC = viewController as? AgeViewController {
//                                ageVC.userAge = user.person.age
//                            }
//                        }
//                    }
                }
            }
        }
        //        guard let welcomeVC = segue.destination as? WelcomeViewController else {
        //            return
        //        }
        //        welcomeVC.user = user.person.name
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
    
    @IBAction func loginButtonPressed() {
        
        textFormatCheck(for: userNameTextField.text)
        textFormatCheck(for: passwordTextField.text)
        
        guard userNameTextField.text == user.login else {
            showAlert(with: "Wrong user name or password", and: "Please, enter correct user name and password")
            return
        }
        
        guard passwordTextField.text == user.password else {
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

extension LoginViewController {
    
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
