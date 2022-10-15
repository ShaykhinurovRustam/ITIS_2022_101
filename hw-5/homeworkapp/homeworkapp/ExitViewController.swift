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
        setupConstraints()
    }
    
    func update() {
        let defaults = UserDefaults.standard
        greetingsLabel.text = "Hello, \(String(describing: defaults.string(forKey: "name")!))"
    }
    
    private func setupConstraints() {
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        NSLayoutConstraint.activate([
            greetingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
    }
    

}
