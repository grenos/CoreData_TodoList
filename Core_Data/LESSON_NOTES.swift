



//CREATE MANAGED OBJECT

// 1) add new file --> Core data, Data model
// 2) add entities (they are classes - object in our database)
// 3) add attributes (they are properties of our classes)
// 4) create relationships between our classes (is for the classes to "speak" with each other)
// 5) while on the data model file click --> Editor on the navbar --> create NSManagedObject Subclasses (to create the managed objects for our model)

//ON A SWIFT PROJECT

//on a Swift project it is usually better to let Xcode do all the work of managing the details for the class generation
//so on the right inspector panel we most probably leave everything as is


//ON A SWIFTUI PROJECT

//on a SwiftUI project is better to manage our objects manually, so we go to the right panel inspector and in the class section we change:

// 1) Module --> Current Product Module
// 2) CodeGen --> MAnual/None

// ---> see model classes files for the manual creation of the classes that represent the entities on the core data model





// TO GET ACCESS TO OUR DATA IN CONTENT VIEW FILE (or also other files?) we need to acces the core data context

// 1) go to file --> SceneDelegate, find --> window.rootViewController
// 2) to access the core data context --> see let managedObjectContext and let contentView in SceneDelegate
// 3) in SceneDelegate file in let rootViewController we pass as rootView: contentView
// 4) in ContentView file add @Environment property wrapper to access the context



