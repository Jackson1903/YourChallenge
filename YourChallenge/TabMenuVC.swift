//
//  TabMenu.swift
//  SwiftTabMenuScreen
//
//  Created by Randall Cerdas Jackson on 7/28/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//


import UIKit

class TabMenu: UINavigationController {
    
    @IBOutlet weak var menuButtonSideBar: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        //UIStatusBarStyle.LightContent
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        //  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.04, green:0.68, blue:0.10, alpha:1.0)
         
        
        if self.revealViewController() != nil {
          menuButtonSideBar.target = self.revealViewController()
          menuButtonSideBar.action = "revealToggle:"
          self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
         }
        // Do any additional setup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func showActionSheet(sender: AnyObject) {
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Elige un equipo", preferredStyle: .ActionSheet)
        
        // 2
        let JuventusAction = UIAlertAction(title: "Juventus FC", style: .Default, handler: {
            (alert: UIAlertAction) -> Void in
            print("Equipo")
        })
        let VillasAction = UIAlertAction(title: "Villas FC", style: .Default, handler: {
            (alert: UIAlertAction) -> Void in
            print("Equipo")
        })
        
        let OtherAction = UIAlertAction(title: "...", style: .Default, handler: {
            (alert: UIAlertAction) -> Void in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("NewTeamVC") 
            self.navigationController?.pushViewController(vc, animated: true)
        })
        //
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel, handler: {
            (alert: UIAlertAction) -> Void in
            print("Cancelled")
        })
        
        
        // 4
        optionMenu.addAction(JuventusAction)
        optionMenu.addAction(VillasAction)
        optionMenu.addAction(OtherAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func logoutTapped(sender : AnyObject) {
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("goto_login", sender: self)
    }
}