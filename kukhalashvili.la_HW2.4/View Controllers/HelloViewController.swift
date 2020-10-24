//
//  HelloViewController.swift
//  kukhalashvili.la_HW2.4
//
//  Created by Admin on 23.10.2020.
//

import UIKit

class HelloViewController: UIViewController {
    
    @IBOutlet var welcomeLable: UILabel!

    var surname = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLable.text = name
        print(name)

    }

    @IBAction func goLoginTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
}
