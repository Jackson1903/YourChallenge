//
//  Constants.swift
//  YourChallenge
//
//  Created by Randall Cerdas Jackson on 9/19/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//

import Foundation

class Constants{

    //Constants General
    var country:String = "CRI"
    var baseURL:String = "http://yourchallenge-appstions.rhcloud.com/services/"
    
    //Service
    var serviceGetCountries:String = "location/getCountries"
    var serviceUpdateUser:String = "player/updateUser"
    var serviceCategories:String = "category/getCategories"
    var serviceAddUser:String = "player/adduser"
    var serviceLogin:String = "player/login"
    var servicePosition:String = "position/getPositions"
    var serviceAddImage:String = "image/addImage"
}