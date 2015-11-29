//
//  RestMessage.swift
//  WSConnectionExample
//
//  Created by Randall Cerdas Jackson on 9/11/15.
//  Copyright (c) 2015 Dennis Bravo Goñi. All rights reserved.
//

import Foundation

class RestMessage: NSString
{
    
    func getMessageLogin(paramUserName:NSString, paramPassword:NSString, paramCountry:NSString) -> NSString
    {
        let post:NSString = "{\"header\":{\"country\":\""+(paramCountry as String)+"\"},\"body\":{\"userName\":\""+(paramUserName as String)+"\",\"password\":\""+(paramPassword as String)+"\"}}"
        return post
    }
    
    func getMessageCountry(paramKey:NSString, paramToken:NSString, paramCountry:NSString) -> NSString
    {
        let post:NSString = "{\"header\":{\"token\":\""+(paramToken as String)+"\",\"key\":\""+(paramKey as String)+"\",\"country\":\""+(paramCountry as String)+"\"},\"body\":{}}"
        
        return post
    }
    
    func getMessageCategory(paramKey:NSString, paramToken:NSString, paramCountry:NSString) -> NSString
    {
        let post:NSString = "{\"header\":{\"token\":\""+(paramToken as String)+"\",\"key\":\""+(paramKey as String)+"\",\"country\":\""+(paramCountry as String)+"\"},\"body\":{}}"
        
        return post
    }
    
    func getMessagePosition(paramKey:NSString, paramToken:NSString, paramCountry:NSString) -> NSString
    {
        let post:NSString = "{\"header\":{\"token\":\""+(paramToken as String)+"\",\"key\":\""+(paramKey as String)+"\",\"country\":\""+(paramCountry as String)+"\"},\"body\":{}}"
        
        return post
    }
    
    func getMessageSingUp(paramUserName:NSString, paramPassword:NSString,paramEmail:NSString) -> NSString
    {
        let post:NSString = "{\"header\":{\"country\":\"CRI\"},\"body\":{\"userName\":\""+(paramUserName as String)+"\",\"password\":\""+(paramPassword as String)+"\", \"email\":\""+(paramEmail as String)+"\"}}"
        
        return post
    }
    
    func getMessageUpdateUser(paramUserName:String, paramToken:String, paramIdCountry:String, paramIdCategory:String, paramIdPosition:String, paramIdRegion:String,paramDate:String, paramEmail:String, paramKey:String, paramCountry:String) -> NSString
    {
        let post:NSString = "{\"header\":{\"key\":\""+paramKey+"\",\"token\":\""+paramToken+"\",\"country\":\""+paramCountry+"\"},\"body\":{\"gameCategory\":{\"idGameCategory\":\""+paramIdCategory+"\"},\"idPlayer\":\""+paramKey+"\",\"estate\":{\"idEstate\":\""+paramIdRegion+"\"},\"position\":{\"idPosition\":\""+paramIdPosition+"\"},\"imagePlayer\":{\"idImagePlayer\": null,\"description\": null,\"extension\": null,\"logo\": null},\"dateBirth\":\""+paramDate+"\",\"userName\":\""+paramUserName+"\",\"country\": {\"idCountry\":\""+paramIdCountry+"\"},\"email\":{\""+paramEmail+"\"}}"
       
        return post
    }
    
    func getMessageChanceImage(paramUserName:String, paramToken:String, paramKey:String, paramCountry:String, base64Image:String, descriptionImage:String, extensionImage:String, typeImage:String) -> NSString
    {
        
        let post:NSString = "{\"header\":{\"key\":\""+paramKey+"\",\"token\":\""+paramToken+"\",\"country\":\""+paramCountry+"\"},\"body\":{\"imageCode\":\""+base64Image+"\",\"description\":\""+descriptionImage+"\",\"extension\":\""+extensionImage+"\",\"type\":\""+typeImage+"\"}}"
       
        return post
    }
    
}
