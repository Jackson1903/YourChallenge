//
//  MapViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    //@IBOutlet weak var menuButton:UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        /*
        var latitude:CLLocationDegrees =  9.904017
        
        var longitude:CLLocationDegrees = -84.013642
        
        var latDelta:CLLocationDegrees = 0.02
        
        var lonDelta:CLLocationDegrees = 0.02
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Niagra Falls"
        
        annotation.subtitle = "One day I'll go here..."
        
        map.addAnnotation(annotation)
        
        
        
        var latitude2:CLLocationDegrees = 9.906722
        
        var longitude2:CLLocationDegrees = -84.016818
        
        var latDelta2:CLLocationDegrees = 0.02
        
        var lonDelta2:CLLocationDegrees = 0.02
        
        var span2:MKCoordinateSpan = MKCoordinateSpanMake(latDelta2, lonDelta2)
        
        var location2:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude2, longitude2)
        
        var region2:MKCoordinateRegion = MKCoordinateRegionMake(location2, span2)
        
        map.setRegion(region2, animated: false)
        
        var annotation2 = MKPointAnnotation()
        
        annotation2.coordinate = location2
        
        annotation2.title = "Niagra Falls Copy"
        
        annotation2.subtitle = "One day I'll go here... Copy"
        
        map.addAnnotation(annotation2)
        
        
        
        
        var latitude3:CLLocationDegrees = 9.901805
        
        var longitude3:CLLocationDegrees = -84.015857
        
        var latDelta3:CLLocationDegrees = 0.02
        
        var lonDelta3:CLLocationDegrees = 0.02
        
        var span3:MKCoordinateSpan = MKCoordinateSpanMake(latDelta3, lonDelta3)
        
        var location3:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude3, longitude3)
        
        var region3:MKCoordinateRegion = MKCoordinateRegionMake(location3, span3)
        
        map.setRegion(region3, animated: false)
        
        var annotation3 = MKPointAnnotation()
        
        annotation3.coordinate = location3
        
        annotation3.title = "Niagra Falls Cpy"
        
        annotation3.subtitle = "One day I'll go here... Cpy"
        
        map.addAnnotation(annotation3)*/
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    }

    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "One day I'll go here..."
        
        map.addAnnotation(annotation)
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
