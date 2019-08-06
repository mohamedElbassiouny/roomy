//
//  Room.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/16/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class Room: NSObject {
    
    var id: Int = 0
    var city : String = ""
    var address : String = ""
    var price : String = ""
    var desc : String = ""
    var bed: Int = 0
    var bath: Int = 0
    var descLink: String = ""
    var leftImage : UIImage = UIImage(named: "PlaceholderImage")!
    var middleImage : UIImage = UIImage(named: "PlaceholderImage")!
    var rightImage : UIImage = UIImage(named: "PlaceholderImage")!
    var descriptionText: String = ""
    var descriptionPicLink: String = ""
    var descriptionPic: UIImageView = UIImageView()
    
}

