//
//  WSConnection.swift
//  WSConnectionExample
//
//  Created by Randall Cerdas Jackson on 9/11/15.
//  Copyright (c) 2015 Dennis Bravo Goñi. All rights reserved.
//

import Foundation


class RestClientMessage:NSObject,NSURLSessionDelegate,NSURLSessionTaskDelegate,NSURLSessionDataDelegate
{
    
    func getConnection(paramBaseURL: String, paramPost: String) -> NSMutableURLRequest
    {
        //Building Message Request
        let post:NSString = paramPost
        
        //Variable  URL servicios
        let url:NSURL = NSURL(string:paramBaseURL)!
        //Variables conexión servicios
        let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        let postLength:NSString = String( postData.length )
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
        
    }
}