//
//  AuthViewController.swift
//  homeworkapp
//
//  Created by Рустам Шайхинуров on 01.10.2022.
//

import UIKit


class AuthViewController: UIViewController {
    
    var user = User(username: "admin", password: "admin")

    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    @IBAction func signInDIdTap(_ sender: Any) {

        if nameField.text == user.getName() && passwordField.text == user.getPassword() {
            guard let tbVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
            
            let defaults = UserDefaults.standard
            defaults.set(nameField.text, forKey: "name")

            tbVC.modalPresentationStyle = .fullScreen
            
            present(tbVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Wrong username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nameField.text = ""
        passwordField.text = ""
    }
    
}
