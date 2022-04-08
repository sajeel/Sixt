//
//  Navigator.swift
//  SixtApp
//
//  Created by Sajjeel Hussain Khilji on 08/04/2022.
//

import Foundation
import UIKit

@objc protocol Navigator: NSObjectProtocol  {
    var childNavigators: [Navigator] { get set }
    var navigationController: UINavigationController { get set }
}
