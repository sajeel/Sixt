//
//  FlippingView.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import SwiftUI

struct FlippingView: View {
    @ObservedObject var flippingViewModel : FlippingViewModel
    
    @State private var flipped = false
    @State var showBack : Bool = false
    @State var navBarHidden = false
    
    init(flippingViewModel : FlippingViewModel) {
        self.flippingViewModel = flippingViewModel
        let coloredAppearance = UINavigationBarAppearance()
            coloredAppearance.configureWithTransparentBackground()
            coloredAppearance.backgroundColor = .gray
           //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().standardAppearance = coloredAppearance
            UINavigationBar.appearance().compactAppearance = coloredAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
       }
    
    @ViewBuilder
    var trailingButton: some View {
        HStack {
            Button(self.showBack ? "List" :"Map") {
                withAnimation(Animation.linear(duration: 0.8)) {
                    self.showBack.toggle()
                }
            }
        }
    }
    
    @ViewBuilder func getListView() -> some View{
        CarsListingView()
    }
    
    
    @ViewBuilder func getMapView() -> some View {
        MapSwiftUIView(mapSwiftUIViewModel: flippingViewModel.mapSwiftUIViewModel)
//            .background(Color.yellow)
//            .edgesIgnoringSafeArea(.all)
    }
    
    
    var body: some View {
        VStack {
            NavigationView {
                VStack(alignment: .leading) {
                    
                    ZStack() {
                        getListView().opacity(flipped ? 0.0 : 1.0)
                        getMapView().opacity(flipped ? 1.0 : 0.0)
                    }
                }
                .modifier(FlipEffect(flipped: $flipped, angle: showBack ? 180 : 0, axis: (x: 0, y: 1)))
                .background(Color.green)
                
                .navigationBarTitle("Cars", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing: trailingButton)
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(false)
                .edgesIgnoringSafeArea(.all)
            }
            .accentColor(.white)
        }
        }
        
}


//struct FlippingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlippingView(flippingViewModel: FlippingViewModel(mapSwiftUIViewModel: MapSwiftUIViewModel(mapViewModel: <#T##MapViewModel<[RemoteCarItem]>#>, storyBoard: <#T##UIStoryboard#>)))
//    }
//}



