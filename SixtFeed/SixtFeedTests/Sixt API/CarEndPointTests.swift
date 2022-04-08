//
//  CarEndPointTests.swift
//  SixtFeedTests
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import XCTest
import SixtFeed

class CarEndPointTests: XCTestCase {
    
    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = CarsEndPoint.get.url(baseURL: baseURL)
        
        XCTAssertEqual(received.scheme, "http", "scheme")
        XCTAssertEqual(received.host, "base-url.com", "host")
    }
}
