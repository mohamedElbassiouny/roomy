//
//  signUpVC.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/20/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signUpViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var emaillabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButton(_ sender: UIButton) {
        guard let name = userNameLabel.text,!name.isEmpty else {return}
        guard let email = emaillabel.text,!email.isEmpty else {return}
        guard let password = passwordLabel.text,!password.isEmpty else {return}

        
        NetworkController.signUp(name: name, email: email, password: password) { (error: Error?, succes: Bool) in
            if succes{
               self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
            }
        }
    }

}
