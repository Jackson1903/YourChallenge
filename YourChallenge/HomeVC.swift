//
//  HomeVC.swift
//  SwiftHomeScreen
//
//  Created by Randall Cerdas Jackson on 7/28/15.
//  Copyright (c) 2015 APPStions. All rights reserved.

import UIKit

class HomeVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        //self.tabBarController!.tabBar.tintColor = UIColor(red:45/255, green:160/255,blue:20/255,alpha:1.0);
        self.navigationController!.navigationBar.barTintColor = UIColor(red:45/255, green:160/255,blue:20/255,alpha:1.0)
        
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
        self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
             //self.usernameLabel.text = prefs.valueForKey("userName") as? String
        }
    }
    
    @IBAction func logoutTapped(sender : UIButton) {
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("goto_login", sender: self)
    }

    
}