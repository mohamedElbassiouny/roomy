//
//  NetworkController.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/20/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkController: NSObject {
    
    
    
    class func logIn(email: String, password: String, completion: @escaping (_ error : Error?, _ succes: Bool)->Void)
    {
        let loginUrl = URLS.login
        
        let parameters = [
            "email" : email,
            "password" : password ]
        
        AF.request(loginUrl, method: .post, parameters: parameters).responseJSON { reponse in
            switch reponse.result
            {
            case.failure(let error ):
                print(error)
            case.success(let value):
                let json = JSON(value)
                
                if let auth_token = json["auth_token"].string{
                    print("auth_token: \(auth_token)")
                    // saving auth_token in DEFAULTS
                    Helper.saveAPIToken(token: auth_token)
                    completion(nil,true)
                }
            }
        }
    }

    
    class func signUp(name: String, email: String, password: String, completion: @escaping (_ error : Error?, _ succes: Bool)->Void)
    {
        let signUpUrl = URLS.signUp
        
        let parameters = [
            "name": name,
            "email" : email,
            "password" : password ]
        
        AF.request(signUpUrl, method: .post, parameters: parameters).responseJSON { reponse in
            switch reponse.result
            {
            case.failure(let error ):
                print(error)
            case.success(let value):
                let json = JSON(value)
                
                if let auth_token = json["auth_token"].string{
                    print("token_API: \(auth_token)")
                    // saving auth_token in DEFAULTS
                    Helper.saveAPIToken(token: auth_token)
                    completion(nil,true)
                }
            }
        }
    }

}
