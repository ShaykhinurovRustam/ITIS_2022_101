import UIKit

class AnimalViewController: UIViewController {

    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var animalImage: UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    @IBAction func closeDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        setupConstraints()

    }
    
    func update() {
        animalImage.image = UIImage(named: "chmonya")
    }
    
    private func setupConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        animalImage.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            animalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            animalImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            animalImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
    }
    
}
