//
//  Room.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/16/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import Foundation
import UIKit

class Room {
    var street : String
    var address : String
    var numRoom : String
    var cost : Int
    var description : String
    
    
    
    var leftImage : UIImage 
    var middleImage : UIImage
    var rightImage : UIImage
    
    
    init(street : String, address:String, numRoom:String, cost:Int, leftImage:UIImage, middleImage:UIImage, rightImage:UIImage, description: String) {
        self.address = address
        self.street = street
        self.numRoom = numRoom
        self.cost = cost
        self.leftImage = leftImage
        self.middleImage = middleImage
        self.rightImage = rightImage
        self.description = description
    }
    
}
