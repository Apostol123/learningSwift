//
//  LoginViewController.swift
//  10ChatApp
//
//  Created by user159106 on 1/16/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if Auth.auth().currentUser != nil {
        
                  self.performSegue(withIdentifier: "fromLoginToChat", sender: self)
        }
        self.navigationController?.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = self.emailTextField.text,
            let password = passwordLabel.text else {
                let alert = UIAlertController(title: "Campos no validos", message: "Introduce infromacion valido en los campos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
        }
      
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
               
                self.performSegue(withIdentifier: "fromLoginToChat", sender:self)
            }
            else { print(error) }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
