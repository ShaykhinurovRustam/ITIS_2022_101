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
        setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nameField.text = ""
        passwordField.text = ""
    }
    
    private func setupConstraints() {
        nameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        

        
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
            
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            signInButton.widthAnchor.constraint(equalToConstant: 180),
            signInButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
}
