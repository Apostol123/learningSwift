//
//  ChatViewController.swift
//  10ChatApp
//
//  Created by user159106 on 1/16/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController , LogOutProtocol{

    @IBOutlet weak var textBoxHight: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    var messagesArray : [Message] = [Message]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.messageTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rescaleMessageZone))
        
        self.tableView.addGestureRecognizer(tapGesture)
        
        tableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        tableView.separatorStyle = .none
        
        self.configureTableView()
        retriveMessagesFromFirebase()
    }
    
    func retriveMessagesFromFirebase() {
        let messagesDB = Database.database().reference().child("Messages")
        
        messagesDB.observe(.childAdded) { (data) in
            let dataValue = data.value as! Dictionary<String, String>
            let sender = dataValue["sender"]!
            let body = dataValue["body"]!
            
            let message = Message(sender: sender, body: body)
            self.messagesArray.append(message)
            self.configureTableView()
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
                tableView.rowHeight = UITableView.automaticDimension
               tableView.estimatedRowHeight = 120
    }
    
    @objc func rescaleMessageZone() {
        self.messageTextField.resignFirstResponder()
        UIView.animate(withDuration: 0.5) {
            self.textBoxHight.constant = 128
            self.view.layoutIfNeeded()
        }

        
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
         logOut()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        self.messageTextField.endEditing(true)
        self.sendButton.isEnabled = false
        self.messageTextField.isEnabled = false
        guard let messageText = messageTextField.text else {
            return
        }
        
        let messagesDB = Database.database().reference().child("Messages")
        let messageDict = ["sender": Auth.auth().currentUser?.email,
                           "body":  messageText]
        messagesDB.childByAutoId().setValue(messageDict) { (error, ref) in
            if error != nil {
                print(error)
            }else {
                self.sendButton.isEnabled = true
                self.messageTextField.isEnabled = true
                self.messageTextField.text = ""
                print("mesage guardado correctamente")
                
            }
            
        }
    }
}

extension ChatViewController : UITableViewDelegate , UITableViewDataSource {
      
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        cell.userNameLabel.text = messagesArray[indexPath.row].sender
        cell.messageLabel.text = messagesArray[indexPath.row].body
        if cell.userNameLabel.text == Auth.auth().currentUser?.email {
            cell.messageImageView.backgroundColor = UIColor.flatLime()
            cell.messageBackground.backgroundColor = UIColor.flatBlue()
        }else {
            cell.messageImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatWhite()
        }
        return cell
    }
    
    
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.textBoxHight.constant = 128 + 280
                   self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        rescaleMessageZone()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}


