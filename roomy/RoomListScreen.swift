//
//  RoomListScreen.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/16/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit

class RoomListScreen: UIViewController {
    
    var rooms : [Room] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rooms = getArray()

        // Do any additional setup after loading the view.
    }
    
    
    func getArray() -> [Room] {
        var tempRooms :[Room] = []
        let firstRoom = Room(street: "35 Pierrepont St #C7", address: "Brooklyn, NY 11236", numRoom: "2 bed 1 bath", cost: 2500, leftImage: "roomA", middleImage: "roomA 2", rightImage: "roomA 3")
        
        
        return tempRooms
        
    }

    


}

extension RoomListScreen:UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
}
