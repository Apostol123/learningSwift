//
//  UserListViewController.swift
//  10ChatApp
//
//  Created by user159106 on 1/26/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Firebase

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var usersArray = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource  = self
        tableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        self.retriveMessagesFromFirebase()

    }
    
 
    

    func retriveMessagesFromFirebase() {
        let messagesDB = Database.database().reference().child("Users")
        
        messagesDB.observe(.childAdded) { (data) in
            let dataValue = data.value as! Dictionary<String,String>
            let email = dataValue["username"]!
           
            let user = User(email: email)
            self.usersArray.append(user)
            self.tableView.reloadData()
        }
    }

}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageTableViewCell
        cell.userNameLabel.isHidden = true
        cell.messageLabel.text = usersArray[indexPath.row].email
        return cell
    }
    
    
}
