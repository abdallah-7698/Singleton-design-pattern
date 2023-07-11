
/*:
 # Singelton with protocol
 
- The SharedHelper protocol declares a single property sharedName, which is a String optional and provides both a getter and a setter.

- The Helper class adopts the SharedHelper protocol by implementing the sharedName property.

- The Helper class also has its own property called name, which is a non-optional String.

- Inside the Helper class, there is a static constant named shared of type SharedHelper, which is assigned to an instance of the Helper class. This represents the shared instance of Helper.

- The private init() is a private initializer that ensures only one instance of Helper can be created.
 
 */

import Foundation

protocol SharedHelper{
    var sharedName: String? { get set }
}

class Helper: SharedHelper {
    
    var sharedName: String?
    var name = "name"
    
    static let shared: SharedHelper = Helper()
    private init() {}
    
}

let helper1 = Helper.shared
//helper1.name // Value of type 'SharedHelper' has no member 'name'

helper1.sharedName

//: MARK:  Change the shared

protocol APIShared{
    func requestDara(from url: String) -> String
}

extension Helper: APIShared{
    
    func requestDara(from url: String) -> String {
        return url
    }
    
    static let apiShared: APIShared = Helper()
    
}


let helper2 = Helper.apiShared
helper2.requestDara(from: "example.com")
