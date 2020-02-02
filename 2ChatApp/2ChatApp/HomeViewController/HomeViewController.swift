//
//  HomeViewController.swift
//  2ChatApp
//
//  Created by user159106 on 2/2/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var model = HomeViewControllerModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if model.isUserLogged() {
            
        } else {
            navigationController?.pushViewController(RegisterViewController(nibName: nil, bundle: nil), animated: true)
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
