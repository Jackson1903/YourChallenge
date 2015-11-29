//
//  PositionModel.swift
//  YourChallenge
//
//  Created by Randall Cerdas Jackson on 9/12/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//

import Foundation

class PositionModel{

    var id:NSInteger  = 0
    var description:NSString = ""
    
    init(id:NSInteger, description:NSString){
        self.id=id
        self.description=description
    }
    
    init(){
    }

}