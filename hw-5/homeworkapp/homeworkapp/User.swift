import Foundation

class User {
    private var username: String
    private var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    public func getName() -> String {
        username
    }
    
    public func getPassword() -> String {
        password
    }
    
}
