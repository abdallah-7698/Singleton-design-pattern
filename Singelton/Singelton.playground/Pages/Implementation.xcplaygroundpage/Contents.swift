//: [Previous](@previous)

/*:

 # Singleton Design Pattern
 
 - singleton is a design pattern used to ensure that only one instance of a class is created and that the instance can be accessed globally. It is commonly used when you need to manage a shared resource or maintain a global state throughout an application.
 
 - class that represents the singleton. The shared property is a static constant that holds the single instance of Helper. The private init() ensures that no other instance of the class can be created.
 
 - By using the shared property, you can access the singleton instance from anywhere in your code, making it easy to maintain a global state or access a shared resource.
 
 */

import Foundation

class Helper {
    
    var name = "name"
    
    private let name1 = "name1"
    
    static let shared = Helper()
    private init() {}
    
}

let helper1 = Helper.shared
let helper2 = Helper.shared

print(helper1 === helper2)

print(helper1.name)

helper1.name = "name 1"

print(helper2.name)


/*:
 
 # Why not struct

##### When considering whether to use a struct or a class for implementing a singleton in Swift, there are a few factors to consider. While it is technically possible to use a struct to create a singleton, there are some limitations and considerations to keep in mind:

- Reference Semantics: Classes in Swift have reference semantics, which means that multiple references to the same instance can exist. This can be beneficial for managing shared state or resources. On the other hand, structs have value semantics, which means that they are copied when assigned or passed as arguments. Using a struct as a singleton may not provide the desired behavior if you need to maintain a single shared instance throughout your application.

- Mutability: If your singleton needs to be mutable and have mutable properties, classes offer more flexibility. You can mark properties as var and modify them even after the singleton instance has been created. Structs, by default, have immutable properties and require the use of the mutating keyword to modify their properties.

- Inheritance: If you need to subclass or inherit from the singleton instance, classes are necessary since Swift doesn't support inheritance for structs.
 
 */


struct StructHelper{
    
    var name = "name"
    
    static let shared = StructHelper()
    private init() {}
    
}

var structHelper = StructHelper.shared

structHelper.name = "Ali"
print(structHelper.name)
print(StructHelper.shared.name)



/*:
 # Another implementation
 
 In this wey we can use the shared instance or we can make ower custom instance
 
 - The Singelton class has a single property called name, which is of type String. This property can be accessed and modified like any other instance variable.

- The shared property is declared as a static constant of type Singelton. It represents the singleton instance of the class. By declaring it as static, you can access it globally without needing to create an instance of the Singelton class.

- The shared property is initialized with an instance of the Singelton class using the default initializer. This ensures that only one instance of Singelton is created throughout the application.
 */

class Singelton{

    var name : String = ""
    
    static let shared = Singelton()
    
}

Singelton.shared.name = "name2"



let object = Singelton()
object.name = "newName"
print(object.name)

print(Singelton.shared.name)



