//
//  ImageView+setImage.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
#if os(iOS)
import UIKit
typealias ImageView = UIImageView
typealias Image = UIImage
import Combine
#endif

#if os(macOS)
import AppKit
typealias ImageView = NSImageView
typealias Image = NSImage
#endif

//import MBProgressHUD
//import ImageCahceEngine
//
//var cancellationToken: AnyCancellable? // 2
//
//let imageCache = ImageCache()
//
//
//extension ImageView {
//    
//    func setImage(with url: URL?) {
//        guard let url = url else {
//            image = nil
//            return
//        }
//        
//        DispatchQueue.main.async {[weak self] in
//            guard let strongSelf = self else { return }
//            MBProgressHUD.showAdded(to: strongSelf, animated: true)
//        }
//        
//        guard let result = imageCache[url] else {
//            DispatchQueue.global(qos: .background).async { [weak self] in
//                guard let strongSelf = self else { return }
//                
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    var result: Image? = nil
//                    if let data = data, let newImage = Image(data: data) {
//                        result = newImage
//                        imageCache[url] = result
//                    } else {
//                        //display a default image in case of error
//                        print("Fetch image error: \(error?.localizedDescription ?? "n/a")")
//                    }
//                    
//                    DispatchQueue.main.async {
//                        MBProgressHUD.hide(for: strongSelf, animated: true)
//                        strongSelf.image = result
//                    }
//                }.resume()
//            }
//            return
//        }
//        DispatchQueue.main.async { [weak self] in
//            guard let strongSelf = self else { return }
//            MBProgressHUD.hide(for: strongSelf, animated: true)
//            strongSelf.image = result
//        }
//        
//    }
//}
//
