import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet var pageNumberLabel: UILabel!
    @IBOutlet var browseCatalogButton: UIButton!
    
    
    @IBAction func browseCatalogDidTap(_ sender: Any) {
        guard let catalogVC = storyboard?.instantiateViewController(withIdentifier: "CatalogViewController") else { return }
        navigationController?.pushViewController(catalogVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        update()
    }
    
    func update() {
        let pages = navigationController?.viewControllers.count ?? 0
        pageNumberLabel.text = "Catalog, Page: \(pages - 1)"
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    private func setupConstraints() {
        pageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        browseCatalogButton.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            pageNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            browseCatalogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            browseCatalogButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
    }
    
    

}
