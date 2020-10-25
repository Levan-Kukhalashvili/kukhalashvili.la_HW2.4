//
//  ThanksViewController.swift
//  kukhalashvili.la_HW2.4
//
//  Created by Admin on 24.10.2020.

import UIKit

class ThanksViewController: UIViewController {

    @IBOutlet var thanksUserName: UINavigationItem!
    
    var surname = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //thanksUserName.title = "\(currentUser.name) \(currentUser.surname)"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let ThanksVC = tabBarController?.viewControllers?.first as! HelloViewController
        thanksUserName.title = "\(ThanksVC.name) \(ThanksVC.surname)"
        
    }

}
