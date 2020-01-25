//
//  ChatViewController.swift
//  10ChatApp
//
//  Created by user159106 on 1/16/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var textBoxHight: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    let messagesArray : [Message] = [Message(),Message(),Message()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(messageTableViewTapped))
        
        self.tableView.addGestureRecognizer(tapGesture)
        
        self.messageTextField.delegate = self
        tableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
    @objc func messageTableViewTapped() {
        self.messageTextField.endEditing(true)
        UIView.animate(withDuration: 0.5) {
            self.textBoxHight.constant = 128
            self.view.layoutIfNeeded()
        }

        
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
         do {
            try Auth.auth().signOut()
            
        } catch  {
            print("No se ha podido hacer el logut")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
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
        messageTableViewTapped()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
