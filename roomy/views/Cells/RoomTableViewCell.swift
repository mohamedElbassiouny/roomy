//
//  RoomTableViewCell.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/26/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bedLabel: UILabel!
    @IBOutlet weak var bathLabel: UILabel!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(roomData:Room) {
        
        addressLabel.text = roomData.address
        cityLabel.text = roomData.city
        priceLabel.text = roomData.price
        bedLabel.text = String(roomData.bed) + "bed"
        bathLabel.text = String(roomData.bath) + "bath"
        leftImage.image = roomData.leftImage
        middleImage.image = roomData.middleImage
        rightImage.image = roomData.rightImage
        
    }
    
    
}
