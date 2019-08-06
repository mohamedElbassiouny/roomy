//
//  LogInViewController.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/19/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInViewController: UIViewController {
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logInButton(_ sender: UIButton) {
        guard let email = emailLabel.text, !email.isEmpty else{return}
        guard let password = passwordLabel.text,!password.isEmpty else {return}
        
        NetworkController.logIn(email: email, password: password) { (error: Error?, succes: Bool) in
            if succes{
                print("welcome")
                self.performSegue(withIdentifier: "roomsSegue", sender: Any?.self)
            }else{
                print("try again")
            }
        }
    
}
}
