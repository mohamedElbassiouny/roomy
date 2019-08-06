//
//  RoomListScreen.swift
//  roomy
//
//  Created by Mohamed Elbassiouny on 7/16/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//
import UIKit
import NVActivityIndicatorView
class RoomListViewController: UIViewController, NVActivityIndicatorViewable {
   
    @IBOutlet weak var roomTableView: UITableView!

    var currentIndex = 0
    var rooms : [Room] = []
    var myindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomTableView.tableFooterView = UIView()
        roomTableView.separatorInset = .zero
        roomTableView.contentInset = .zero
    
            startAnimating()
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
            roomTableView.addSubview(refresher)
            let myXibFile = UINib(nibName: "RoomTableViewCell", bundle: nil)
            roomTableView.register(myXibFile, forCellReuseIdentifier: "roomyCell")
            handleRooms()
        }
        
        lazy var refresher: UIRefreshControl = {
            let refresher = UIRefreshControl()
            refresher.addTarget(self, action: #selector(handleRooms), for: .valueChanged)
            return refresher
        }()
        
        @objc func signOutButton() {
            UserDefaults.standard.removeObject(forKey: "auth_token")
            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "start")
            present(tab, animated: true)
        }
        
        @objc private func handleRooms() {
            refresher.endRefreshing()
            if internetCheck.isConnectedToInternet() {
                GetRooms.getRoomsFromBackend { (_: Error?, Rooms: [Room]?) in
                    if let Rooms = Rooms {
                        self.rooms = Rooms
                        self.roomTableView.reloadData()
                    }
                }
                stopAnimating()
            }
            else {
                GetRooms.getRoomsFromBackend { (_: Error?, Rooms: [Room]?) in
                    if let Rooms = Rooms {
                        self.rooms = Rooms
                        self.roomTableView.reloadData()
                    }
                }
                stopAnimating()
            }
        }
        
    }


extension RoomListViewController: UITableViewDelegate {}

extension RoomListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = rooms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomyCell") as! RoomTableViewCell
        cell.configCell(roomData: room)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DiscriptionViewController {
            destination.desc = rooms[currentIndex]
        }
    }
}

extension RoomListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
