//
//  ViewController.swift
//  Map
//
//  Created by 문정호 on 2022/01/24.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationinfo1: UILabel!
    @IBOutlet var lblLocationinfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
    }
    

}

