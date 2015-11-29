//
//  UpdateUserVC.swift
//  YourChallenge
//
//  Created by Randall Cerdas Jackson on 9/2/15.
//  Copyright (c) 2015 APPStions. All rights reserved.
//
import UIKit


class UpdateUserVC: UIViewController, SBPickerSelectorDelegate, UITextFieldDelegate,  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //UI Components Not Editable
    @IBOutlet weak var labUserName: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    //UI Components Editable
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtPosition: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtRegion: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var btnGetOut: UIBarButtonItem!
    
    //Id Picker Selected
    var pickerSelected:NSInteger = 0
    
    //Instants Manager
    var categoryManager = CategoryManager()
    var countryManager = CountryManager()
    var positionManager = PositionManager()
    var regionManager = RegionManager()
    var dateManager = DateManager()
    
    //Picker's Array
    var arrayCategory:[NSDictionary] = []
    var arrayCountry:[NSDictionary] = []
    var arrayPosition:[NSDictionary] = []
    var arrayRegion:[NSDictionary] = []
    var arrayPicker:[String] = []
    
    //Index's
    var indexDictionaryCountry:NSDictionary = NSDictionary()
    var indexDictionaryPosition:NSDictionary = NSDictionary()
    var indexDictionaryCategory:NSDictionary = NSDictionary()
    var indexDictionaryRegion:NSDictionary = NSDictionary()
    
    //Id's
    var idCategory:String = ""
    var idPosition:String = ""
    var idCountry:String = ""
    var idRegion:String = ""
    
    //Global Variables
    var restMessage = RestMessage()
    var updateUserManager = UpdateUserManager()
    let constants = Constants()
    
    //Prefs
    let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var userName:String = ""
    var email:String = ""
    var token:NSString = ""
    var key:NSString = ""
    
    
    @IBAction func openImage(sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        print("Image Selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        imageProfile.image = image
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        self.navigationController!.navigationBar.barTintColor = UIColor(red:45/255, green:160/255,blue:20/255,alpha:1.0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        if self.revealViewController() != nil {
            btnGetOut.target = self.revealViewController()
            btnGetOut.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        userName = (prefs.valueForKey("userName") as? String)!
        email = (prefs.valueForKey("email") as? String)!
        token = (prefs.valueForKey("token") as? String)!
        key   = (prefs.valueForKey("key") as? String)!
        
        self.labUserName.text = userName
        self.txtEmail.text = email
        
        //self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func showRegion(sender: AnyObject) {
        
        pickerSelected=4
        /*let picker: SBPickerSelector = SBPickerSelector.picker()
        
        picker.pickerData = ["Turrialba","La Unión","Juan Viñas","Tres Rios"] //Picker Content
        picker.delegate = self
        picker.pickerType = SBPickerSelectorType.Text
        picker.doneButtonTitle = "Listo"
        picker.cancelButtonTitle = "Cancelar"
        
        let point: CGPoint = view.convertPoint(sender.frame.origin, fromView: sender.superview)
        
        var frame: CGRect = sender.frame
        frame.origin = point
        picker.showPickerIpadFromRect(frame, inView: view)
        */
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("MapViewController") 
        self.navigationController?.pushViewController(vc, animated: true)
        
        //self.performSegueWithIdentifier("go_to", sender: self)
    }
    
    
    @IBAction func showCategory(sender: AnyObject) {
        
        pickerSelected=2
        let picker: SBPickerSelector = SBPickerSelector.picker()
        
        let restMessage = RestMessage()
        
        let post: NSString = restMessage.getMessageCategory(key,paramToken: token,paramCountry: constants.country)
        
        arrayCategory = categoryManager.getCategories(post, serviceToBaseUrl: constants.serviceCategories)
        var arrayPicker:[String] = []
        
        for var index = 0; index < arrayCategory.count; index++ {
            let descriptionCategory:NSDictionary = arrayCategory[index]
            let description:NSString = descriptionCategory.objectForKey("description") as! NSString
            arrayPicker.append(description as String)
        }
        
        picker.pickerData = arrayPicker //Picker Content
        picker.delegate = self
        picker.pickerType = SBPickerSelectorType.Text
        picker.doneButtonTitle = "Listo"
        picker.cancelButtonTitle = "Cancelar"
        
        let point: CGPoint = view.convertPoint(sender.frame.origin, fromView: sender.superview)
        var frame: CGRect = sender.frame
        frame.origin = point
        picker.showPickerIpadFromRect(frame, inView: view)
    }
   
    
    @IBAction func showPosition(sender: AnyObject) {
        
        pickerSelected=1
        let picker: SBPickerSelector = SBPickerSelector.picker()
        
        let restMessage = RestMessage()
        
        let post: NSString = restMessage.getMessagePosition(key , paramToken: token, paramCountry: constants.country)
        
        arrayPosition = categoryManager.getCategories(post, serviceToBaseUrl: constants.servicePosition)
        var arrayPicker:[String] = []
        
        for var index = 0; index < arrayPosition.count; index++ {
            let descriptionCategory:NSDictionary = arrayPosition[index]
            let description:NSString = descriptionCategory.objectForKey("description") as! NSString
            arrayPicker.append(description as String)
        }
        
        picker.pickerData = arrayPicker //Picker Content
        picker.delegate = self
        picker.pickerType = SBPickerSelectorType.Text
        picker.doneButtonTitle = "Listo"
        picker.cancelButtonTitle = "Cancelar"
        
        let point: CGPoint = view.convertPoint(sender.frame.origin, fromView: sender.superview)
        var frame: CGRect = sender.frame
        frame.origin = point
        picker.showPickerIpadFromRect(frame, inView: view)
        
    }
    
    
   
    @IBAction func showDate(sender: AnyObject) {
        
        let picker: SBPickerSelector = SBPickerSelector.picker()
        
        picker.pickerType = SBPickerSelectorType.Date
        picker.datePickerType = SBPickerSelectorDateType.Default
        picker.delegate = self
        picker.minYear = 1990
        picker.maxYear = 2051
        picker.doneButtonTitle = "Listo"
        picker.cancelButtonTitle = "Cancelar"
        picker.showPickerOver(self)
    }
    
    @IBAction func showCountry(sender: AnyObject) {
        
        pickerSelected = 3
        let picker: SBPickerSelector = SBPickerSelector.picker()
        
        let restMessage = RestMessage()
        
        
        let post: NSString = restMessage.getMessageCountry(key,paramToken: token,paramCountry: constants.country)
        
        arrayCountry = countryManager.getCountry(post, serviceToBaseUrl: constants.serviceGetCountries)
        var arrayPicker:[String] = []
        
        for var index = 0; index < arrayCountry.count; index++ {
            let descriptionCountry:NSDictionary = arrayCountry[index]
            let description:NSString = descriptionCountry.objectForKey("description") as! NSString
            arrayPicker.append(description as String)
        }
       
        picker.pickerData = arrayPicker //Picker Content
        picker.delegate = self
        picker.pickerType = SBPickerSelectorType.Text
        picker.doneButtonTitle = "Listo"
        picker.cancelButtonTitle = "Cancelar"
        
        let point: CGPoint = view.convertPoint(sender.frame.origin, fromView: sender.superview)
        var frame: CGRect = sender.frame
        frame.origin = point
        picker.showPickerIpadFromRect(frame, inView: view)
        

        
    }
    
    
    func pickerSelector(selector: SBPickerSelector!, selectedValue value: String!, index idx: Int) {
    
    switch pickerSelected {
        
    case 1:
            txtPosition.text=value
            txtPosition.selectedTextRange = nil
            indexDictionaryPosition = arrayPosition[idx]
            idPosition = indexDictionaryPosition.objectForKey("idPosition") as! String
    case 2:
            txtCategory.text=value
            txtCategory.selectedTextRange = nil
            indexDictionaryCategory = arrayCategory[idx]
            idCategory = indexDictionaryCategory.objectForKey("idGameCategory") as! String
    case 3:
            txtCountry.text=value
            txtCountry.selectedTextRange = nil
            indexDictionaryCountry = arrayCountry[idx]
            idCountry = indexDictionaryCountry.objectForKey("idCountry") as! String
    case 4:
            txtRegion.text=value
            txtRegion.selectedTextRange = nil
            indexDictionaryRegion = arrayRegion[idx]
            idRegion = indexDictionaryRegion.objectForKey("idRegion") as! String
    default:
            txtDate.text=value
            txtDate.selectedTextRange = nil
        
    }
        pickerSelected = 0
   }
    
    func pickerSelector(selector: SBPickerSelector!, dateSelected date: NSDate!) {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        txtDate.text = dateFormat.stringFromDate(date)
    }
    
    @IBAction func updateUser(sender: UIButton) {
        
        //var id:NSString = categoryManager.getIdCategory(txtCategory.text, arrayCategories: arrayCategory, indexId: indexCategory)
       
        //var date:NSString = txtDate.text
        //var position:NSString = txtPosition.text
        //var email:NSString = txtEmail.text
        //var category:NSString = txtCategory.text
        //var country:NSString = txtCountry.text
        //var region:NSString = txtRegion.text
      
       /* if ( date.isEqualToString("") || position.isEqualToString("") || email.isEqualToString("") || category.isEqualToString("") || country.isEqualToString("") || region.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Fallo en el Ingreso"
            alertView.message = "Por favor ingrese su nombre de usuario y contraseña"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        
        } else {*/
        
        
        let imageBase : UIImage = UIImage(named:"YourChallenge_Alert_Green")!
        
        let cgsizeapp = CGSizeMake(1, 1)
        
        let imageData = UIImagePNGRepresentation(imageWithSize(imageBase, size:  cgsizeapp))

        let base64String = imageData!.base64EncodedStringWithOptions([])
        

        let post:NSString = restMessage.getMessageChanceImage(userName, paramToken:  token as String, paramKey: key as String , paramCountry: constants.country as String, base64Image: base64String, descriptionImage: "test", extensionImage: "jpg", typeImage: "P")
        
        let authenticationMessage:NSString = updateUserManager.postUpdateUser(post as String, serviceToBaseUrl: constants.serviceAddImage)
        
        
        //updateUserManager.postUpdateUser(post as String , serviceToBaseUrl: constants.servicePosition)
        
        
        
                    //Validación fallida o éxitosa de la petición Login
                    if(authenticationMessage == "success")
                    {
                        let alertView:UIAlertView = UIAlertView()
                        
                        alertView.title = "Acción"
                        alertView.message = "Actualizado" as String
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    } else {
                        
                        let alertView:UIAlertView = UIAlertView()
                        
                        alertView.title = "Ingreso incorrecto"
                        alertView.message = authenticationMessage as String
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
        
        //}
    }
    
    func imageWithSize(image: UIImage,size: CGSize)->UIImage{
        if UIScreen.mainScreen().respondsToSelector("scale"){
            UIGraphicsBeginImageContextWithOptions(size,false,UIScreen.mainScreen().scale);
        }
        else
        {
            UIGraphicsBeginImageContext(size);
        }
        
        image.drawInRect(CGRectMake(0, 0, size.width, size.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    
}