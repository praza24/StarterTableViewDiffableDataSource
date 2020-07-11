import Foundation

struct Place: Decodable {
    let uuid: String
    let name: String
    let description: String
    let imageName: String
}

extension Place: Hashable {

    //Structs automatically conform to the Hashable Protcol
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(uuid)
//        hasher.combine(name)
//        hasher.combine(description)
//        hasher.combine(imageName)
//    }
}

extension Array where Element == Place {
    
    static var osakaStubs: Self {
        try! Bundle.decodeJSONFromMainResources(filename: "osaka") //Returns an Array of Places
    }
    
    static var kyotoStubs: Self {
        try! Bundle.decodeJSONFromMainResources(filename: "kyoto")
    }

    static var tokyoStubs: Self {
        try! Bundle.decodeJSONFromMainResources(filename: "tokyo")
    }
}
