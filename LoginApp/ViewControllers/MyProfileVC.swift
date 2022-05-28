//
//  MyProfileVC.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 28.05.2022.
//

import UIKit

class MyProfileVC: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName = ""
    var userLastname = ""
    var age = 0
    var hobbies: [String] = []
    var photo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "\(userName) \(userLastname)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ageVC = segue.destination as? AgeViewController {
            ageVC.userAge = age
        } else if let hobbiesVC = segue.destination as? HobbiesViewController {
            hobbiesVC.userHobbies = hobbies
        } else if let photoVC = segue.destination as? PhotoViewController {
            photoVC.imageName = photo
        }
    }
}
