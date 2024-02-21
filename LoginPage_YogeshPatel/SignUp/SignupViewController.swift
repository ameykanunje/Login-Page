//
//  SignupViewController.swift
//  LoginPage_YogeshPatel
//
//  Created by csuftitan on 2/20/24.
//

import UIKit

class SignupViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
