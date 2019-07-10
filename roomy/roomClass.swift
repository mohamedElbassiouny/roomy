//
//  roomClass.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/10/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import Foundation
import UIKit
class RoomClas
{
    let image1 : UIImage
    let image2 : UIImage
    let image3 : UIImage
    

    
    var address :String
    var cost : String
    var state : String
    var content : String
    
    init(image1 : UIImage , image2:UIImage , image3 : UIImage, address :String 
        , cost : String ,state : String, content : String)
    {
        self.image1 = image1
        self.image2 = image2
        self.image3 = image3
        
        self .address = address
        self.cost = cost
        self.state = state
        self.content = content
    }
    
    
}
