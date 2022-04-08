//
//  CarItemsMapper.swift
//  SixtFeed
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//



import Foundation
import CoreLocation

/*
 "id": "WMWSW31030T222518",
     "modelIdentifier": "mini",
     "modelName": "MINI",
     "name": "Vanessa",
     "make": "BMW",
     "group": "MINI",
     "color": "midnight_black",
     "series": "MINI",
     "fuelType": "D",
     "fuelLevel": 0.7,
     "transmission": "M",
     "licensePlate": "M-VO0259",
     "latitude": 48.134557,
     "longitude": 11.576921,
     "innerCleanliness": "REGULAR",
     "carImageUrl": "https://cdn.sixt.io/codingtask/images/mini.png"
 
 "id": "WMWSW31080T222501",
     "modelIdentifier": "mini",
     "modelName": "MINI",
     "name": "Beate",
     "make": "BMW",
     "group": "MINI",
     "color": "midnight_black",
     "series": "MINI",
     "fuelType": "D",
     "fuelLevel": 0.65,
     "transmission": "M",
     "licensePlate": "M-VO0253",
     "latitude": 48.163106,
     "longitude": 11.564346,
     "innerCleanliness": "VERY_CLEAN",
     "carImageUrl": "https://cdn.sixt.io/codingtask/images/mini.png"
 
 
 */



 
public struct RemoteCarItem: Decodable, Identifiable {
    public let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: String
    let carImageUrl: String
    
    public init(id: String
                ,modelIdentifier: String
                ,modelName: String
                , name: String
                , make: String
                , group: String
                , color: String
                , series: String
                , fuelType: String
                , fuelLevel: Double
                , transmission: String
                , licensePlate: String
                , latitude: Double
                , longitude: Double
                , innerCleanliness: String
                , carImageUrl: String) {
        self.id = id
        self.modelIdentifier = modelIdentifier
        self.modelName = modelName
        self.name = name
        self.make = make
        self.group = group
        self.color = color
        self.series = series
        self.fuelType = fuelType
        self.fuelLevel = fuelLevel
        self.transmission = transmission
        self.licensePlate = licensePlate
        self.latitude = latitude
        self.longitude = longitude
        self.innerCleanliness = innerCleanliness
        self.carImageUrl = carImageUrl
    }
    
    public func getCoordinates() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public func getDescription() -> String {
         return "\(name) \(make)"
    }
    
    public func getImageUrl() -> String {
         return carImageUrl
    }
}




public final class CarItemMapper {
    private struct Root: Decodable {
        let items: [RemoteCarItem]
    }
    
    public enum Error: Swift.Error {
        case invalidRequest
        case invalidData
        case parsingKeyNotFound
        case parsingvalueNotFound
        case parsingTypeMismatch
        case parsingGeneralError
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteCarItem] {
        //guard response.isOK, let root = try? JSONDecoder().decode([Root.self], from: data) else {
        guard response.isOK else {
            throw Error.invalidRequest
        }
        
        do {
            let carItems = try JSONDecoder().decode([RemoteCarItem].self, from: data)
            return carItems
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw Error.parsingKeyNotFound
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw Error.parsingvalueNotFound
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw Error.parsingTypeMismatch
        } catch {
            print("error: ", error)
            throw Error.parsingGeneralError
        }
        
        
    }
}
