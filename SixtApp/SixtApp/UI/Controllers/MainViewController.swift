//
//  MainViewController.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import UIKit
import SwiftUI
import Then
import Combine
import SixtFeed
class MainViewController: UIViewController {

    fileprivate var mainViewModel: MainViewModel?
    fileprivate var navigator: MainNavigator?
    fileprivate var _storyBoard: UIStoryboard?
    
    static func createWith(navigator: MainNavigator, storyboard: UIStoryboard, viewModel: MainViewModel) -> MainViewController {
        return storyboard.instantiateViewController(ofType: MainViewController.self).then { vc in
            vc.navigator = navigator
            vc._storyBoard = storyboard
            vc.mainViewModel = viewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFlippingViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
      }
    
    
    private func getFlippingViewModel() -> FlippingViewModel?{
        guard let mainViewModel = mainViewModel else {
            return nil
        }
        
        let loader = mainViewModel.makeRemoteCarsLoader
        let resourceLoader = CarsMainResourceLoader(loader: loader )
        let mapViewModel  = MapViewModel(resourceLoader:  resourceLoader)
        let carsListingViewModel = CarsListingViewModel(resourceLoader: resourceLoader)
        return FlippingViewModel(
            mapViewModel: mapViewModel,
            carsListingViewModel: carsListingViewModel)
    }
    
    private func addFlippingViewController(){
       
        guard let flippingViewModel = getFlippingViewModel() else {return}
        
        let childViewController = UIHostingController(rootView: FlippingView(flippingViewModel: flippingViewModel))
        self.addChild(childViewController)
        childViewController.view.backgroundColor = UIColor.red
        childViewController.view.frame = self.view.bounds
        self.view.addConstrained(subview: childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    
   
}

