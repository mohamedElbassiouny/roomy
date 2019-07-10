//
//  ViewController.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/10/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: UIButton)
    {
        performSegue(withIdentifier: "fromHomeSegue", sender: self)
    }
    
}

