//
//  RoomParsing.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/25/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

extension NetworkController
{
    
    /*
         id": 1,
         "title": "First Room",
         "price": "200$",
         "place": "Tahrir",
         "image": "www.google.com",
         "description": "Anything goes here",
         "created_at": "2009-04-30T09:44:35.000Z",
     */
    
    class func getRoomsFromBackend(completion: @escaping (_ error: Error?, _ rooms: [Room]?) -> Void) {
        guard let auth_token = UserDefaults.standard.object(forKey: "auth_token") as? String else {
            completion(nil, nil)
            return
        }
        
        let roomsURL = URLS.rooms
        let headers: HTTPHeaders = ["Authorization": auth_token]
        
        AF.request(roomsURL, method: HTTPMethod.get, parameters: nil, headers: headers).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                guard let json = JSON(value).array else {
                    completion(nil, nil)
                    return
                }
                
                
                var rooms = [Room]()
                for data in json {guard let data = data.dictionary else {return}
                
                let room = Room()
                let roomDataStoring = RoomDataStoring()
                
                room.id = data["id"]?.int ?? 0
                room.desc = data["description"]?.string ?? ""
                room.cost = data["price"]?.string ?? "0$"
                room.address = data["title"]?.string ?? "title"
                room.street = data["place"]?.string ?? "place"
                room.descLink = data["image"]?.string ?? "image link"
                rooms.append(room)
                roomDataStoring.addRoomsToRealm(room: room)
            }
            completion(nil, rooms)
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            
        }
    }
    
    
        func getRoomsFromRealm(completion: @escaping (_ error: Error?, _ rooms: [Room]?) -> Void) {
        guard (UserDefaults.standard.object(forKey: "auth_token") as? String) != nil else {
            completion(nil, nil)
            return
        }
        
        var rooms = [Room]()
        let offLineRooms = RoomDataStoring()
        let offRooms = offLineRooms.readAllRoomsFromRealm()
        
        for data in offRooms {
            let room = Room()
            
            room.id = data.id
            room.desc = data.desc
            room.cost = data.cost
            room.address = data.address
            room.street = data.street
            room.descLink = data.descLink
            rooms.append(room)
        }
        completion(nil, rooms)
    }
    }
}
