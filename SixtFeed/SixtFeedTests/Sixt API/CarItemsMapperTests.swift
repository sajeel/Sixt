//
//  CarItemsMapperTests.swift
//  SixtFeedTests
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import XCTest
import SixtFeed

class CarItemsMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let json = makeItemsJSON([])
        let samples = [199, 201, 300, 400, 500]
        
        try samples.forEach { code in
            XCTAssertThrowsError(
                try CarItemMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try CarItemMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func test_map_deliversNoItemsOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])
        
        let result = try CarItemMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, [])
    }
    
    func test_map_deliversItemsOn200HTTPResponseWithJSONItems() throws {
        let item1 = makeItem(
            id: "UUID",
            carImageUrl: "http://a-url.com")
        
        let item2 = makeItem(
            id: "UUID",
            modelIdentifier: "a modelIdentifier",
            modelName: "a modelName",
            carImageUrl:"http://another-url.com")
        
        let json = makeItemsJSON([item1.json, item2.json])
        
        let result = try CarItemMapper.map(json, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, [item1.model, item2.model])
    }
    
    // MARK: - Helpers
    
    private func makeItem(id: String
                          ,modelIdentifier: String? = nil
                          ,modelName: String? = nil
                          , name: String? = nil
                          , make: String? = nil
                          , group: String? = nil
                          , color: String? = nil
                          , series: String? = nil
                          , fuelType: String? = nil
                          , fuelLevel: Double? = nil
                          , transmission: String? = nil
                          , licensePlate: String? = nil
                          , latitude: Double? = nil
                          , longitude: Double? = nil
                          , innerCleanliness: String? = nil
                          , carImageUrl: String) -> (model: RemoteCarItem, json: [String: Any]) {
        let item = RemoteCarItem(id: id, modelIdentifier: modelIdentifier ?? " a modelIdentifier", modelName: modelName ?? "a model name", name: name ?? "a name", make: make ?? "a make", group: group ?? "a group" , color: color ?? "a color", series: series ?? "a series", fuelType: fuelType ?? "a fuel type", fuelLevel: fuelLevel ?? 0.0, transmission: transmission ?? "a tranmission", licensePlate: licensePlate ?? "a license plate", latitude: latitude ?? 0.0, longitude: longitude ?? 0.0, innerCleanliness: innerCleanliness ?? "a innercleanliness" , carImageUrl: carImageUrl )
        
        let object = [
            "id": id,
            "modelIdentifier": modelIdentifier ?? " a modelIdentifier",
            "modelName": modelName ?? "a model name",
            "name": name ?? "a name",
            "make": make ?? "a make",
            "group": group ?? "a group",
            "color": color ?? "a color",
            "series": series ?? "a series",
            "fuelType": fuelType ?? "a fuel type",
            "fuelLevel": fuelLevel ?? 0.0,
            "transmission": transmission ?? "a tranmission",
            "licensePlate": licensePlate ?? "a license plate",
            "latitude": latitude ?? 0.0,
            "longitude": longitude ?? 0.0,
            "innerCleanliness": innerCleanliness ?? "a innercleanliness",
            "carImageUrl": carImageUrl
        ]
            
        let json =  object.compactMapValues { $0 }
        
        return (item, json)
    }
    
    
    
}
