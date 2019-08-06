//
//  listing screenViewController.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/18/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit
import Kingfisher

class DiscriptionViewController: UIViewController {
    @IBOutlet weak var listingImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
     var desc: Room?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listingImageView.image = desc?.leftImage
        infoLabel.text = desc?.description

        // Do any additional setup after loading the view.
    }
    
   
}
