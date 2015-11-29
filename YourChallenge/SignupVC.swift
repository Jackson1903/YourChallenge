//
//  SignupVC.swift
//  SwiftLoginScreen
//
//  Created by Randall Cerdas Jackson on 7/28/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    //Global Variables
    let constants = Constants()
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtConfirmPassword : UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func  preferredStatusBarStyle()-> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func gotoLogin(sender : UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func signupTapped(sender : UIButton) {
        
        var username:NSString = txtUsername.text as NSString
        var password:NSString = txtPassword.text as NSString
        var confirm_password:NSString = txtConfirmPassword.text as NSString
        var email:NSString = txtEmail.text as NSString
    
        
        var lgConnection = LoginManager()
        var restMessage = RestMessage()
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Fallo en el Registro"
            alertView.message = "Por favor ingrese su nombre de usuario y contraseña"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else if ( !password.isEqual(confirm_password) ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Fallo en el Registro"
            alertView.message = "Por favor ingrese su nombre de usuario y contraseña"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
            var sgConnection = SingupManager()
            var restMessage = RestMessage()
            
            var post:NSString = restMessage.getMessageSingUp(username, paramPassword: password, paramEmail: email)
            
            var authenticationMessage:NSString = sgConnection.signUpUser(post, serviceToBaseUrl: constants.baseURL)
            
            if(authenticationMessage == "success")
            {
                self.dismissViewControllerAnimated(true, completion: nil)
                
            } else {
                
                var alertView:UIAlertView = UIAlertView()
                
                alertView.title = "Ingreso incorrecto"
                alertView.message = authenticationMessage as String
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
