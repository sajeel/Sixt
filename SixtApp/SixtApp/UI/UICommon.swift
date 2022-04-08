//
//  UICommon.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import CoreLocation
import URLImageStore
import URLImage


struct UICommon {
   static  let centerCoordinates = CLLocationCoordinate2DMake(48.189471, 11.574494)
    static let maxCenterCoordinateDistance: CLLocationDistance = 20000000
    
    public struct ImageCachingStrategy {
        public static let urlImageServiceForInMemory = URLImageService(fileStore: nil,
                                              inMemoryStore: URLImageInMemoryStore())
    }
}
