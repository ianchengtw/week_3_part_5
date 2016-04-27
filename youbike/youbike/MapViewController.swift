//
//  MapViewController.swift
//  youbike
//
//  Created by Ian on 4/26/16.
//  Copyright © 2016 AppWorks School Ian Cheng. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MyMap!
//    var lng: Double = 0.0
//    var lat: Double = 0.0
    var station: Station = Station()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var location = CLLocationCoordinate2D(
            latitude: self.station.lat,
            longitude: self.station.lng
        )
        
        var span = MKCoordinateSpanMake(0.015, 0.015)
        
        var region = MKCoordinateRegion(center: location, span: span)
        
        self.myMapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = self.station.title
        annotation.subtitle = self.station.address
        
        self.myMapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}