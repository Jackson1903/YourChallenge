//
//  UserModel.swift
//  WSConnectionExample
//
//  Created by Randall Cerdas Jackson on 9/11/15.
//  Copyright (c) 2015 Dennis Bravo Goñi. All rights reserved.
//

import Foundation

class UserModel {
    
    var username:NSString = ""
    var password:NSString = ""
    var email:NSString = ""
    var country:NSString = ""
    var token:NSString = ""
    var category:NSInteger = 0
    var position:NSInteger = 0
    
    init(username:NSString, password:NSString, email:NSString, country:NSString, token:NSString, category:NSInteger, position:NSInteger){
        self.username=username
        self.password=password
        self.email=email
        self.country=country
        self.token=token
        self.category=category
        self.position=position
    }
    
    init(){
        
    }
}