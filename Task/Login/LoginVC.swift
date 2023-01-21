//
//  ViewController.swift
//  Task
//
//  Created by Apple on 20/01/2023.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var emailErrorLbl: UILabel!
    @IBOutlet var passwordErrorLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxt.delegate = self
        passwordTxt.delegate = self
        loginBtn.layer.cornerRadius = 9
    }

    @IBAction func loginBtnAction(_ sender: Any) {
        if validationForm(){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomePageVC") as!HomePageVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func validationForm() -> Bool{
        if validateEmail() == true && validatePassword() == true{
            return true
        }else{
            return false
        }
    }
    @discardableResult fileprivate func validateEmail() -> Bool{
        if emailTxt.isEmpty{
            self.emailErrorLbl.isHidden = false
            self.emailErrorLbl.text = StringConstant.emptyField
            return false
        }else if !emailTxt.isValidEmail{
            self.emailErrorLbl.isHidden = false
            self.emailErrorLbl.text = StringConstant.invalidEmail
            return false
        }else{
            self.emailErrorLbl.isHidden = true
            self.emailErrorLbl.text = ""
            return true
        }
    }
    @discardableResult fileprivate func validatePassword() -> Bool{
        if passwordTxt.isEmpty{
            self.passwordErrorLbl.isHidden = false
            self.passwordErrorLbl.text = StringConstant.emptyField
            return false
        }else if !passwordTxt.isValidPassword{
            self.passwordErrorLbl.isHidden = false
            self.passwordErrorLbl.text = StringConstant.invalidPassword
            return false
        }else{
            self.passwordErrorLbl.isHidden = true
            self.passwordErrorLbl.text = ""
            return true
        }
    }
}
extension LoginVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTxt{
            validateEmail()
        }else if textField == passwordTxt{
            validatePassword()
        }
    }
}
