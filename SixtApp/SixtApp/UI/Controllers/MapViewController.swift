//
//  MapViewController.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import UIKit
import SixtFeed
import MapKit
import Combine

public final class MapViewController: UIViewController {//, ResourceLoadingView, ResourceErrorView {
    @IBOutlet private var mapView: MKMapView!
    static private var defaultStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    fileprivate var viewModel: MapViewModel!
    private(set) public var errorView = ErrorView()
    private var cancellables: Set<AnyCancellable> = []

    public var onRefresh: (() -> Void)?
    
    
    static func createWith(viewModel: MapViewModel) -> MapViewController {
        return defaultStoryboard.instantiateViewController(ofType: MapViewController.self).then { vc in
            vc.viewModel = viewModel
        }
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        let initialCoordinates = UICommon.centerCoordinates
        let initialLocation = CLLocation(latitude: initialCoordinates.latitude, longitude: initialCoordinates.longitude)
        mapView.centerToLocation(initialLocation)
        
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: UICommon.maxCenterCoordinateDistance)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        mapView.delegate = self
        mapView.register(
          CarAnnotationView.self,
          forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        
        loadInitialData()
        bindData()
                
    }
    
    
    private func bindData(){
        viewModel.resourceLoader.$dataSource.sink { [weak self] cars in
            let annotations = self?.getAnnotationsFromModel(cars: cars)
            self?.mapView.addAnnotations(annotations ?? [])
        }
        .store(in: &cancellables)
    }
    
    
    
    private func getAnnotationsFromModel(cars: [RemoteCarItem]) -> [CarAnnotation] {
        return cars.map { car in
            CarAnnotation(title: car.getDescription(), coordinate: car.getCoordinates())
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    private func loadInitialData(){
        let annotation = CarAnnotation(title: "Hello",
                                       coordinate: CLLocationCoordinate2DMake(25.786, 51.3245))
        mapView.addAnnotation(annotation)
        
        viewModel.resourceLoader.loadResource()
    }
    
    
    @IBAction private func refresh() {
        onRefresh?()
    }
    
    
    
//    public func display(_ sections: [CellController]...) {
//        var snapshot = NSDiffableDataSourceSnapshot<Int, CellController>()
//        sections.enumerated().forEach { section, cellControllers in
//            snapshot.appendSections([section])
//            snapshot.appendItems(cellControllers, toSection: section)
//        }
//
//        if #available(iOS 15.0, *) {
//            dataSource.applySnapshotUsingReloadData(snapshot)
//        } else {
//            dataSource.apply(snapshot)
//        }
//    }
//
//    public func display(_ viewModel: ResourceLoadingViewModel) {
//        refreshControl?.update(isRefreshing: viewModel.isLoading)
//    }
//
//    public func display(_ viewModel: ResourceErrorViewModel) {
//        errorView.message = viewModel.message
//    }
//
   
}




extension MapViewController: MKMapViewDelegate {
    public func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        guard let annotation = annotation as? CarAnnotation else {
            return nil
        }
        let identifier = "cars"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
