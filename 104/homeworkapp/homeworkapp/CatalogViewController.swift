//
//  CatalogViewController.swift
//  homeworkapp
//
//  Created by Рустам Шайхинуров on 04.10.2022.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet var pageNumberLabel: UILabel!
    
    @IBAction func browseCatalogDidTap(_ sender: Any) {
        guard let catalogVC = storyboard?.instantiateViewController(withIdentifier: "CatalogViewController") else { return }
        navigationController?.pushViewController(catalogVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        let pages = navigationController?.viewControllers.count ?? 0
        pageNumberLabel.text = "Catalog, Page: \(pages - 1)"
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    
    

}
