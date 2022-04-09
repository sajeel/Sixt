//
//  XCTestCase+MemoryLeakTracking.swift
//  SixtFeedTests
//
//  Created by Sajjeel Hussain Khilji on 07/04/2022.
//

import Foundation
import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
