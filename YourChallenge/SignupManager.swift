//
//  SignupManager.swift
//  YourChallenge
//
//  Created by Randall Cerdas Jackson on 9/13/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//

import Foundation


class SingupManager:RestClientMessage{

    //Global Variables
    let constants = Constants()
    
    func signUpUser(post:NSString,serviceToBaseUrl: NSString) -> NSString{
       
        var restClientMss = RestClientMessage()
        var baseUrl:String = constants.baseURL+(serviceToBaseUrl as String)
        var reponseError: NSError?
        var response: NSURLResponse?
        var resultMessage:NSString = ""
        
        var request:NSMutableURLRequest = restClientMss.getConnection(baseUrl, paramPost:post as String)
        
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    var error: NSError?
                   
                    
                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as! NSDictionary
                    
                    let success:Bool = jsonData.valueForKey("body") as! Bool
                    
                    if(success == true)
                    {
                        resultMessage="success"
                        //self.dismissViewControllerAnimated(true, completion: nil)
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