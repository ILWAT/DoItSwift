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
        lblLocationinfo1.text=""
        lblLocationinfo2.text=""
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest //정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() //위치 데이터를 추적하기 위해 사용자에게 승인을 요구함.
        locationManager.startUpdatingLocation() //위치 업데이트
        myMap.showsUserLocation=true //위치 보기 값을 true로 설정
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double){
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations:[CLLocation]){
        let pLocation = locations.last
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, Error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationinfo1.text="현재 위치"
            self.lblLocationinfo2.text=address
            
            
        })
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
    }
    

}

