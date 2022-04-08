//
//  MainNavigator.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import UIKit
import Combine
import SixtFeed

@objc class MainNavigator : NSObject, Navigator {
    lazy private var defaultStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var childNavigators = [Navigator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - segues list
    enum Segue {
        case Main
        case Map(loader: () -> AnyPublisher<[RemoteCarItem], Error>)
        
    }
    
    // MARK: - invoke a single segue
    func show(segue: Segue, sender: UIViewController) {
        switch segue {
        case .Main:
            //show the map
            let vm = MainViewModel()
            show(target: MainViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender:  sender)
        case let .Map(loader):
            let vm = MapViewModel(loader: loader)
            show(target: MapViewController.createWith(storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender:  sender)
        }
    }
    
    
    
    func childDidFinish(_ child: Navigator?) {
        for (index, navigator) in childNavigators.enumerated() {
            if navigator === child {
                childNavigators.remove(at: index)
                break
            }
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController) {
        if let nav = sender as? UINavigationController {
            //push root controller on navigation stack
            nav.pushViewController(target, animated: false)
            return
        }
        
        if let nav = sender.navigationController {
            //add controller to navigation stack
            nav.pushViewController(target, animated: true)
        } else {
            //present modally
            sender.present(target, animated: true, completion: nil)
        }
    }
}
