//: [Previous](@previous)

import UIKit

/*:
 
# What is bad about Singelton

- Hidden dependencies: Singletons can introduce hidden dependencies because they are globally accessible and can be accessed from anywhere in the codebase. This can make it difficult to identify and manage the dependencies of a class or module.

- Class remains in memory: Once a singleton instance is created, it remains in memory throughout the lifetime of the application. This can lead to increased memory usage, especially if the singleton holds onto significant resources or data that are no longer needed.

- Difficulties in mocking or testing: Singletons can be challenging to mock or test in isolation. Since they are globally accessible, it's not straightforward to replace a singleton instance with a test double or mock object, making it harder to isolate the behavior of a specific class or module during testing.

- Violation of the Single Responsibility Principle (SRP): Singletons can violate the SRP because they often take on multiple responsibilities, such as managing shared state, handling resource access, and providing global access. This can lead to increased complexity and make the codebase less maintainable.

- Breakage of Dependency Inversion Principle (DIP): Singletons can break the DIP, which states that high-level modules should not depend on low-level modules but both should depend on abstractions. Singletons often represent concrete implementations and can create tight coupling between modules.

- Potential for unintended side effects: Since singletons are globally accessible, any part of the code can modify their state. This can lead to unexpected behavior and bugs, as changes made in one part of the code can impact the behavior of other classes or modules that rely on the singleton.

- Singletons can be thread-unsafe by default because they introduce shared mutable state, and concurrent access to that shared state can lead to race conditions and unexpected behavior
 
 */

// MARK:  Correct use it to use dependancy injection to inject the Singleton to the file

struct User{}


// MARK:  Ipml 1

//class ApiClient {
//    static let instance = ApiClient()
//    private init() {}
//
//    func login(completion: (User) -> Void){}
//    func signup(user: User, completion: () -> Void){}
//}
//
//// but this way is not the best way of make Singelton
//// there is a func that i do not need
//class LoginViewController{
//    var apiClient = ApiClient.instance
//
//    func didTapLoginButton(){
//        apiClient.login { user in
//            // Make action
//        }
//    }
//
//}
//
//class SignupViewController{
//    var apiClient = ApiClient.instance
//
//    func didTapSignupButton(){
//        apiClient.signup(user: User()) {
//            // update UI
//        }
//    }
//
//}

// MARK:  Ipml 2

// solve two problems
// 1- class only access the func they need
// 2- class do not depends on the instance

class ApiClient {
    static let instance = ApiClient()
    private init() {}
}

// but this way is not the best way of make Singelton
// there is a func that i do not need

protocol LoginApiProtocol{
    func login(completion: (User) -> Void)
}

extension ApiClient: LoginApiProtocol{
    func login(completion: (User) -> Void){}
}

class LoginViewController{
    var apiClient: LoginApiProtocol
    
    
    init(apiClient: LoginApiProtocol = ApiClient.instance){
        self.apiClient = apiClient
    }
    
    func didTapLoginButton(){
        apiClient.login { user in
            // Make action
        }
    }
    
}

protocol SignupApiProtocol{
    func signup(user: User, completion: () -> Void)
}

extension ApiClient: SignupApiProtocol{
    func signup(user: User, completion: () -> Void){}
}

class SignupViewController{
    var apiClient: SignupApiProtocol
    
    init(apiClient: SignupApiProtocol = ApiClient.instance){
        self.apiClient = apiClient
    }
    
    func didTapSignupButton(){
        apiClient.signup(user: User()) {
            // update UI
        }
    }
}
