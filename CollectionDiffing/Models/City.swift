import Foundation

//MARK: Represents sections
enum City: String, CaseIterable {
    case kyoto
    case osaka
    case tokyo
}

extension City {
    
    static var stubCitiesWithPlaces: [(city: City, places: [Place])] {
        [
            (.osaka, .osakaStubs),
            (.kyoto, .kyotoStubs),
            (.tokyo, .tokyoStubs)
        ]
    }
}
