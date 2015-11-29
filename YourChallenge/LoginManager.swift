//
//  LoginManager.swift
//  WSConnectionExample
//
//  Created by Randall Cerdas Jackson on 9/11/15.
//  Copyright (c) 2015 Dennis Bravo Goñi. All rights reserved.
//

import Foundation

class LoginManager: RestClientMessage
{
    //Global Variables
    let constants = Constants()
    
    func getLoginUser(post: String, serviceToBaseUrl: String) -> NSString
    {
        let restClientMss = RestClientMessage()
        let baseUrl:String = constants.baseURL + serviceToBaseUrl
        var reponseError: NSError?
        var response: NSURLResponse?
        var resultMessage:NSString = ""
        
        let request:NSMutableURLRequest = restClientMss.getConnection(baseUrl, paramPost:post)
        var urlData: NSData?
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
        } catch let error as NSError {
            reponseError = error
            urlData = nil
        }
        
        if  urlData != nil  {
            
            let res = response as! NSHTTPURLResponse!;
            
            if (res.statusCode >= 200 && res.statusCode < 300)
            {
                var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                var error: NSError?
                
                let jsonData:NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers )) as! NSDictionary
                
                //Obtiene información Header
                let header:NSDictionary = jsonData.valueForKey("header") as! NSDictionary
                let status:NSString = header.valueForKey("status") as! NSString
                
                //Validación fallida o éxitosa de la petición Login
                if(status == "success")
                {
                   //Obtiene los valores dentro del header
                    let header:NSDictionary = jsonData.valueForKey("header") as! NSDictionary

                   //Obtiene información Body
                    let body:NSDictionary = jsonData.valueForKey("body") as! NSDictionary
                    
                    let userName:NSString = body.valueForKey("userName") as! NSString
                    let email:NSString = body.valueForKey("email") as! NSString
                    let token:NSString = header.valueForKey("token") as! NSString
                    let key:NSString = body.valueForKey("idPlayer") as! NSString
                    
                    let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                    prefs.setObject(userName, forKey: "userName")
                    prefs.setObject(email, forKey: "email")
                    prefs.setObject(token, forKey: "token")
                    prefs.setObject(key, forKey: "key")
                    prefs.setInteger(1, forKey: "ISLOGGEDIN")
                    prefs.synchronize()
                    resultMessage = "success"
                } else {
                    var error_msg:NSString
                    if jsonData["error_message"] as? NSString != nil {
                        error_msg = jsonData["error_message"] as! NSString
                    } else {
                        error_msg = "Unknown Error"
                    }
                  resultMessage = error_msg as NSString
                 }
            } else {
                resultMessage = "Error en conexión a Internet"
            }
        } else {
            if let error = reponseError {
                resultMessage = (error.localizedDescription)
            }
        }
        return resultMessage
      }
    }