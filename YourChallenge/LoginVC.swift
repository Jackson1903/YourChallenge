//
//  LoginVC.swift
//  SwiftLoginScreen
//
//  Created by Randall Cerdas Jackson on 7/28/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//

import UIKit

class LoginVC:UIViewController,UITextFieldDelegate {
    
    //Global Variables
    let constants = Constants()
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    
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
    
    @IBAction func signinTapped(sender : UIButton) {
        
        let username:NSString = txtUsername.text!
        let password:NSString = txtPassword.text!
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Fallo en el Ingreso"
            alertView.message = "Por favor ingrese su nombre de usuario y contraseña"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
       
        } else {
           
            let lgConnection = LoginManager()
            let restMessage = RestMessage()
            
            
            let post:NSString = restMessage.getMessageLogin(username, paramPassword: password, paramCountry: constants.country)
            
            let authenticationMessage:NSString = lgConnection.getLoginUser(post as String, serviceToBaseUrl:constants.serviceLogin as String)
            
            if(authenticationMessage == "success")
            {
                self.dismissViewControllerAnimated(true, completion: nil)
                
            } else {
                let alertView:UIAlertView = UIAlertView()
                
                alertView.title = "Ingreso incorrecto"
                alertView.message = authenticationMessage as String
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
