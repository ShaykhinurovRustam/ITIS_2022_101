//
//  AnimalViewController.swift
//  homeworkapp
//
//  Created by Рустам Шайхинуров on 04.10.2022.
//

import UIKit

class AnimalViewController: UIViewController {

    
    @IBOutlet var animalImage: UIImageView!
    
    @IBAction func closeDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()

    }
    
    func update() {
        animalImage.image = UIImage(named: "chmonya")
    }
    
}
