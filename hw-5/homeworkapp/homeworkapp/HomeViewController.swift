import UIKit


class HomeViewController: UIViewController {
    
    var username = ""

    @IBOutlet var greetingsLabel: UILabel!
    @IBOutlet var browseCatalogButton: UIButton!
    @IBOutlet var animalImagesButton: UIButton!
    
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
        setupConstraints()
    }
    
    func update() {
        let defaults = UserDefaults.standard
        greetingsLabel.text = "Hello, \(String(describing: defaults.string(forKey: "name")!))"
    }
    
    private func setupConstraints() {
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        browseCatalogButton.translatesAutoresizingMaskIntoConstraints = false
        animalImagesButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        NSLayoutConstraint.activate([
            greetingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            browseCatalogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            browseCatalogButton.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 10),
            browseCatalogButton.widthAnchor.constraint(equalToConstant: 180),
            browseCatalogButton.heightAnchor.constraint(equalToConstant: 30),
            
            animalImagesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animalImagesButton.topAnchor.constraint(equalTo: browseCatalogButton.bottomAnchor, constant: 10),
            animalImagesButton.widthAnchor.constraint(equalToConstant: 180),
            animalImagesButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    

}
