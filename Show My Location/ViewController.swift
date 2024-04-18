//
//  ViewController.swift
//  Show My Location
//
//  Created by Ian Kincaid on 4/18/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // Double type variables to hold three values
    var latitude: Double?
    var longitude: Double?
    var altitude: Double?
    
    // instance of CLLocationManager to hold all location info
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var myLatitude: UITextField!
    @IBOutlet weak var myLongitude: UITextField!
    @IBOutlet weak var myAltitude: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        // Request permission to track location
        locationManager.requestWhenInUseAuthorization()
        // Start updating location info
        locationManager.startUpdatingLocation()
    }
    
    // instance method to check if GPS Authorization has changed
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        // If authorized, update location
        if status == .authorizedWhenInUse {
            print("GPS allowed.")
            myMap.showsUserLocation = true
        }
        else {
            print("GPS not allowed.")
            return
        }
    }
    
    // instance method to update location info
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myCoordinate = locationManager.location?.coordinate
        altitude = locationManager.location?.altitude
        latitude = myCoordinate?.latitude
        longitude = myCoordinate?.longitude
        // Place location values in text fields
        myLatitude.text = String(latitude!)
        myLongitude.text = String(longitude!)
        myAltitude.text = String(altitude!)
    }


}

