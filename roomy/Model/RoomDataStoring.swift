//
//  RoomDataStoring.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/25/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit
import RealmSwift

class RoomDataStoring: Object {
    @objc dynamic var id: Int = 1000
    @objc dynamic var city: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var bed: Int = 0
    @objc dynamic var bath: Int = 0
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var descriptionLink: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func addRoomsToRealm (room: Room){
        let realm = try! Realm()
        try! realm.write {
            
            let roomRealm = RoomDataStoring()
            roomRealm.id = room.id
            roomRealm.city = room.city
            roomRealm.address = room.address
            roomRealm.price = room.price
            roomRealm.bed = room.bed
            roomRealm.bath = room.bath
            roomRealm.descriptionText = room.desc
            roomRealm.descriptionLink = room.descLink
            realm.add(roomRealm, update: .modified)
        }
    }
    
    func readAllRoomsFromRealm() -> Results <RoomDataStoring>{
        let realm = try! Realm()
        let rooms = realm.objects(RoomDataStoring.self)
        return rooms
    }

}
