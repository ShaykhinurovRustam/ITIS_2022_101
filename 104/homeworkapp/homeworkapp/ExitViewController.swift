//
//  ExitViewController.swift
//  homeworkapp
//
//  Created by Рустам Шайхинуров on 04.10.2022.
//

import UIKit

class ExitViewController: UIViewController {

    var username = ""
    
    @IBOutlet var greetingsLabel: UILabel!
    @IBOutlet var signOutButton: UIButton!
    
    
    @IBAction func signOutDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        let defaults = UserDefaults.standard
        greetingsLabel.text = "Hello, \(String(describing: defaults.string(forKey: "name")!))"
    }
    

}
