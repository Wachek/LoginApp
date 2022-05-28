//
//  PhotoViewController.swift
//  LoginApp
//
//  Created by Вячеслав Турчак on 28.05.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
    }
}
