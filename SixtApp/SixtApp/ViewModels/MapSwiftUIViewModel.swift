//
//  MapSwiftUIViewModel.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import SwiftUI
import SixtFeed

class MapSwiftUIViewModel : ObservableObject {
    let mapViewModel :MapViewModel<[RemoteCarItem]>
    let storyBoard: UIStoryboard
    
    init(mapViewModel: MapViewModel<[RemoteCarItem]> , storyBoard: UIStoryboard) {
        self.mapViewModel = mapViewModel
        self.storyBoard = storyBoard
    }
}
