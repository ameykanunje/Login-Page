//
//  LoginTableViewController.swift
//  LoginPage_YogeshPatel
//
//  Created by csuftitan on 2/6/24.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //eliminate keyboard after typing
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        validateLogin()
    }
    
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
            
    }
}


//Mark - Layout Centre
extension LoginTableViewController{
    //if we return tableView height it will fit to all devices
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height
//    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight)/2.0
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
}

//Mark - Validate Login Page
extension LoginTableViewController{
    fileprivate func validateLogin() {
        if let email = txtEmail.text, let password = txtPassword.text{
            if !email.validateEmail(){
                openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert, actionTitles: ["Okay"], actionStyles:[.default], actions: [{ _ in
                    print("Okay Clicked")
                }])
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Entered password is invalid(ateast 1 number)", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions:[{ _ in
                    print("Okay Clicked")
                }])
            }else{
                //Navigation - Home Screen
            }
        }else{
            openAlert(title: "Alert", message: "Email and password incorrect", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions:[{ _ in
                print("Okay Clicked")
            }])
        }
    }
}

////Mark - Hide Keyboard
//extension LoginTableViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginTableViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}
