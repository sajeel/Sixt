//
//  CarAnnotationView.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import MapKit
import SixtFeed


class CarAnnotationView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let carItem = newValue as? RemoteCarItem else {
        return
      }

      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48)))
      mapsButton.setBackgroundImage(#imageLiteral(resourceName: "Map"), for: .normal)
      rightCalloutAccessoryView = mapsButton

//      image = carItem.image
      
      let detailLabel = UILabel()
      detailLabel.numberOfLines = 0
      detailLabel.font = detailLabel.font.withSize(12)
      detailLabel.text = carItem.getDescription()
      detailCalloutAccessoryView = detailLabel
    }
  }
}


class CarMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let carItem = newValue as? RemoteCarItem else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      // 2
//      markerTintColor = carItem.markerTintColor
//      glyphImage = carItem.carImageUrl
    }
  }
}
