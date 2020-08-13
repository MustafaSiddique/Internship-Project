//
//  Map.swift
//  TrialProject
//
//  Created by Mustafa on 8/11/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Map: BaseController, CLLocationManagerDelegate {
    
    //    MARK:- Properties
    let manager = CLLocationManager()
    
    //    MARK:- IBOutlets
    @IBOutlet var mapView : MKMapView!
    
    //    MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest   // Battery consume more because of GPS...
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    //    MARK:- Location Update
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        //MARK:- MAP PIN
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
    }
    
}
