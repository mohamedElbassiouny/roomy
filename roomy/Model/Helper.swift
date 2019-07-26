//
//  Helper.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/23/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func restartAPP() {
        guard let window = UIApplication.shared.keyWindow else {return}
       
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        if getAPIToken() == nil{
                // go to auth screen
            vc = sb.instantiateInitialViewController()!
        }else{
            vc = sb.instantiateViewController(withIdentifier: "Main")
        }
        
        vc = window.rootViewController!
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    

    class func saveAPIToken(token:String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "auth_token")
        def.synchronize()
        
        restartAPP()
    }
    
    
    class func getAPIToken()->String?
    {
        let def = UserDefaults.standard
        return def.object(forKey: "auth_token")as? String
    }
}

