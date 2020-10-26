//
//  AboutMeViewController.swift
//  kukhalashvili.la_HW2.4
//
//  Created by Admin on 24.10.2020.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var userName: UINavigationItem!
    @IBOutlet var aboutMeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let aboutMeVC = tabBarController?.viewControllers?.first as! HelloViewController
        userName.title = "\(aboutMeVC.name) \(aboutMeVC.surname)"
        aboutMeText.text = aboutMeVC.descriptionUser
        
    }
}
