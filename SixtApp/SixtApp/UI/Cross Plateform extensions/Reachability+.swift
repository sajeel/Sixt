/*
 * Copyright (c) 2016-2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

//import Foundation
//import RxSwift
//import Reachability
//
//
//
//extension Reachability {
//  enum Errors: Error {
//    case unavailable
//  }
//}
//
//extension Reactive where Base: Reachability {
//
//  static var reachable: Observable<Bool> {
//    return Observable.create { observer in
//
//      let reachability = Reachability.forInternetConnection()
//
//      if let reachability = reachability {
//        observer.onNext(reachability.isReachable())
//        reachability.reachableBlock = { _ in observer.onNext(true) }
//        reachability.unreachableBlock = { _ in observer.onNext(false) }
//        reachability.startNotifier()
//      } else {
//        observer.onError(Reachability.Errors.unavailable)
//      }
//
//      return Disposables.create {
//        reachability?.stopNotifier()
//      }
//    }
//  }
//}
