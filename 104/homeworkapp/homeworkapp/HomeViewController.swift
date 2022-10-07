//
//  HomeViewController.swift
//  homeworkapp
//
//  Created by Рустам Шайхинуров on 01.10.2022.
//

import UIKit


class HomeViewController: UIViewController {
    
    var username = ""

    @IBOutlet var greetingsLabel: UILabel!
    
    
    @IBAction func animalImageDidTap(_ sender: Any) {
        guard let animalVC = storyboard?.instantiateViewController(withIdentifier: "AnimalViewController") as? AnimalViewController else { return }
        
        animalVC.modalPresentationStyle = .fullScreen

        present(animalVC, animated: true)
    }
    
    @IBAction func browseCatalogDidTap(_ sender: Any) {
        guard let catalogVC = storyboard?
            .instantiateViewController(identifier: "CatalogViewController") as? CatalogViewController else { return }
        
        self.navigationController?.pushViewController(catalogVC, animated: true)
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
