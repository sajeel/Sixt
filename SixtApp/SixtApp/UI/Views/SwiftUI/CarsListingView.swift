//
//  CarsListingView.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import SwiftUI
import URLImage
import Combine
import SixtFeed

//defaultCar

public struct CarCell : View {
    var name: String
    var imagePath: String
    
    public var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                if let url = URL(string: self.imagePath) {
                    URLImage(url) { error, retry in
                        
                    } content: { image in
                        image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(4)
                            .padding([.all])
                    }
                    .frame(width: 100, height: 100)
                    .environment(\.urlImageService, UICommon.ImageCachingStrategy.urlImageServiceForInMemory)
                }
                Divider()
                Text(name)
                    .font(.body)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
                
                
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(15)
            
        }
       
    }
}


struct CarsListingView: View {
    @ObservedObject var viewModel : CarsListingViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.cars, id: \.id) { model in
                CarCell(name: model.getDescription(),
                        imagePath: model.getImageUrl())
            }.listRowBackground(Color.green)
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding(.top, 50)
        .edgesIgnoringSafeArea(.all)
    }
}

//struct CarsListingView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarsListingView()
//    }
//}
