//
//  RoomListScreen.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/16/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit

class RoomListScreen: UIViewController {
    var currentIndex = 0
    var rooms : [Room] = []
     var myindex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rooms = getArray()

        // Do any additional setup after loading the view.
    }
    
    
    func getArray() -> [Room] {
        var tempRooms :[Room] = []
        let firstRoom = Room(street: "35 Pierrepont St #C7", address: "Brooklyn, NY 11236", numRoom: "2 bed 1 bath", cost: 2500, leftImage: UIImage(named: "roomA")!, middleImage : UIImage(named: "roomA 2")!, rightImage: UIImage(named: "roomA 3")!, description:"Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.")
        
        let secondRoom = Room(street: "86 Gerrymain Rd #F3", address: "New York, NY 11253", numRoom: "1 bed 1 bath", cost: 1250, leftImage: UIImage(named: "roomB")!, middleImage : UIImage(named: "roomB2")!, rightImage: UIImage(named: "roomB3")! , description:"Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.")
        
        let thirdRoom = Room(street: "22 Yonker St #B4", address: "Queens, NY 11539", numRoom: "3 bed 2 bath", cost: 4200, leftImage: UIImage(named: "roomC")!, middleImage : UIImage(named: "roomC2")!, rightImage: UIImage(named: "roomC3")!,description:"Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.")
        
        let fourthRoom = Room(street: "90 Simmons Rd #M3", address: "Brooklyn, NY 11236", numRoom: "2 bed 1 bath", cost: 2700, leftImage: UIImage(named: "roomD")!, middleImage : UIImage(named: "roomD2")!, rightImage: UIImage(named: "roomD3")! , description:"Stunning corner home 1 bedroom 1 bathroom with approximately 1,068 square feet of living space! The master bedroom features a large walk-in closet offering ample storage. There is a beautiful gourmet chef's kitchen with a large absolute black granite island, in-sink garbage disposal, and GE stainless steel appliances. The apartment features hardwood solid white oak floors, solar shades in the living room, black out shades in the bedrooms and LED track lighting throughout.")
        
        
        
        
        tempRooms.append(firstRoom)
        tempRooms.append(secondRoom)
        tempRooms.append(thirdRoom)
        tempRooms.append(fourthRoom)

        return tempRooms
        
    }

    


}

extension RoomListScreen:UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = rooms[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier:  "roomCell") as! RoomCell
        
        cell.setRoom(room: room)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? listingScreen{
              destination.desc = rooms[currentIndex]
        }
    }
    
    
}
