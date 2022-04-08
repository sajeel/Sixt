//
//  MapRepresentableSwiftUI.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import SwiftUI
import SixtFeed

struct MapRepresentableSwiftUI : UIViewControllerRepresentable {
    typealias UIViewControllerType = MapViewController
    var mapViewModel: MapViewModel
    
    func makeUIViewController(context: Context) -> MapViewController {
        let mapViewController: MapViewController = MapViewController.createWith(viewModel: mapViewModel)
        return mapViewController
    }

    func updateUIViewController(_ mapViewController: MapViewController, context: Context) {
        
    }


}
