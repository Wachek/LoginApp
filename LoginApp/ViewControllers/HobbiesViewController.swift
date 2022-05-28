//
//  HobbiesViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 28.05.2022.
//

import UIKit

class HobbiesViewController: UIViewController {

    @IBOutlet var hobbiesLabel: UILabel!
    
    var userHobbies: [String] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let hobbiesString = userHobbies.joined(separator: "\n")
        hobbiesLabel.text = "My hobbies are: \n\(hobbiesString)"
    }

}
