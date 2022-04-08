//
//  MapSwiftUIView.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import SwiftUI

struct MapSwiftUIView: View {
    var mapViewModel : MapViewModel
    
    var body: some View {
        MapRepresentableSwiftUI(mapViewModel:mapViewModel)
    }
}

//struct MapSwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
////        MapSwiftUIView()
//    }
//}
