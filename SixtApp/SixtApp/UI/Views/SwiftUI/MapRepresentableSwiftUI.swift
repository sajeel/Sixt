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
    var mapSwiftUIViewModel: MapSwiftUIViewModel
    
    func makeUIViewController(context: Context) -> MapViewController {
        let mapViewController: MapViewController = MapViewController.createWith( storyboard: mapSwiftUIViewModel.storyBoard, viewModel: mapSwiftUIViewModel.mapViewModel)
        return mapViewController
    }

    func updateUIViewController(_ mapViewController: MapViewController, context: Context) {
        
    }


}
