//
//  RegisterViewController.swift
//  10ChatApp
//
//  Created by user159106 on 1/16/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet var labelPassword2: UITextField!
    
    @IBOutlet var labelPassword: UITextField!
    @IBOutlet var email1Label: UITextField!
    
    @IBOutlet var buttonCreateAccount: UIButton!
    
    @IBOutlet var termsAndConditionSwitch: UISwitch!
    
    @IBOutlet var termsAndConditionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if !termsAndConditionSwitch.isOn {
            let alert = UIAlertController(title: "Terminos y condiciones", message: "No has acceptado los terminos y condiciones", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        guard self.labelPassword.text == self.labelPassword2.text else {
            let alert = UIAlertController(title: "Contraseñas no validas", message: "Las contraseñas no son iguales", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                       self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard let email = self.email1Label.text , let pass = self.labelPassword.text else {
            let alert = UIAlertController(title: "Email no valido", message: "Introduce un corre valido", preferredStyle: .alert)
                                  alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                  self.present(alert, animated: true, completion: nil)
            return
        }
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                self.performSegue(withIdentifier: "fromRegisterToChat", sender: self)
            }
        }
    }
    
    @IBAction func switchStateChanged(_ sender: UISwitch) {
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
