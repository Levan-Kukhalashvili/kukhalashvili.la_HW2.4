//
//  LoginViewController.swift
//  kukhalashvili.la_HW2.4
//
//  Created by Admin on 23.10.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var currentUser = User(login: "", name: "", surname: "", userPassword: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        for user in users {
            if userTF.text == user.login && passwordTF.text == user.userPassword {
                performSegue(withIdentifier: "hellowSegue", sender: nil)
                currentUser = user
            }
        }
        if currentUser.login == "" {
            let alert = UIAlertController(
                title: "Oops🤪",
                message: "Пользователь не найден",
                preferredStyle: .alert
            )
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func unwindSegueToLoginVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "loginSegue" else { return }
        guard segue.source is HelloViewController else { return }
        passwordTF.text = ""
        logOut()
    }
    
    @IBAction func forgotUserName(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Oops🤪",
            message: "Your name: \(currentUser.login)",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Oops🤪",
            message: "Your password: \(currentUser.userPassword)",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(currentUser)
        let tabBarController = segue.destination as! UITabBarController
        let destinationVC = tabBarController.viewControllers?.first as!
            HelloViewController
        destinationVC.name = currentUser.name
        
    }
    
    private func configureTextFields() {
        userTF.delegate = self
        passwordTF.delegate = self
    }
    
    private func logOut() {
        currentUser = User(login: "", name: "", surname: "", userPassword: "")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == userTF {
            passwordTF.becomeFirstResponder()
        }
        return true
    }
    
}
