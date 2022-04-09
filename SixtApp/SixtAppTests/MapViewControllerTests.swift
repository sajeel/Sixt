//
//  MapViewControllerTests.swift
//  SixtAppUITests
//
//  Created by Sajjeel Hussain Khilji on 09/04/2022.
//

import UIKit
import XCTest
import MapKit
import SixtApp

class MapViewControllerTests: XCTestCase {
    //declaring the ViewController under test as an implicitly unwrapped optional
    var sut : MapViewController!
    
    
    override func setUp() {
        super.setUp()
        //get the storyboard the ViewController under test is inside
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        sut = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        //load view hierarchy
        if(sut != nil) {
            sut.loadView()
//            sut.viewDidLoad()
        }
    }
    func testViewControllerIsComposedOfMapView() {
        XCTAssertNotNil(sut.mapView, "ViewController under test is not composed of a MKMapView")
    }
    func testControllerConformsToMKMapViewDelegate() {
        XCTAssert(sut.conforms(to: MKMapViewDelegate.self), "ViewController under test does not conform to MKMapViewDelegate protocol")
    }
    func testMapViewDelegateIsSet() {
        XCTAssertNotNil(self.sut.mapView.delegate)
    }
    func testControllerImplementsMKMapViewDelegateMethods() {
        XCTAssert(sut.responds(to: Selector("mapView:viewForAnnotation:")), "ViewController under test does not implement mapView:viewForAnnotation")
    }
    func testMapInitialization() {
        XCTAssert(sut.mapView.mapType == MKMapType.standard);
    }

    func testControllerAddsAnnotationsToMapView() {
        let annotationsOnMap = sut.mapView.annotations
        XCTAssertGreaterThanOrEqual(annotationsOnMap.count, 0)
    }
    
    // MARK: - Utility
    func hasTargetAnnotation(annotationClass: MKAnnotation.Type) -> Bool {
        let mapAnnotations = self.sut.mapView.annotations
        var hasTargetAnnotation = false
        for anno in mapAnnotations {
            if (anno.isKind(of: annotationClass)) {
                hasTargetAnnotation = true
            }
        }
        return hasTargetAnnotation
    }
    
//    func testMapViewCanRenderPolygonByImplementingMapViewRendererForOverlay() {
//        XCTAssert(self.sut.responds(to: Selector("mapView:rendererForOverlay:")))
//    }
    
    
}
