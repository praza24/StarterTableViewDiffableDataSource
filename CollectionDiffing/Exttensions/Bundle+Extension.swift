import Foundation

extension Bundle {
    
    //MARK: Returns a decodable object
    static func decodeJSONFromMainResources<D: Decodable>(filename: String) throws -> D  {
        guard let url = main.url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "File not found in main bundle"])
        }
        
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(D.self, from: data)
        return decoded
    }
    
}
