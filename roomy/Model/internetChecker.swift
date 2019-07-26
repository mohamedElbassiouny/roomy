//
//  internetChecker.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/26/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import Foundation
import Alamofire

class internetCheck{
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

