//
//  ViewController.swift
//  NavigationMission
//
//  Created by 문정호 on 2022/02/15.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    var isZoom2 = false
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom2
        editViewController.delegate = self
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
            txMessage.text = message
        }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }
        else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat=2.0
        var newWidth:CGFloat,newHeight:CGFloat
        if(isZoom){
            if(isZoom2){
            }
            else{
                //self.isZoom = false
                self.isZoom2 = true
                newWidth=imgView.frame.width*scale
                newHeight=imgView.frame.height*scale
                imgView.frame.size=CGSize(width: newWidth,height: newHeight)
            }
        }
        else {
            if isZoom2{
                //self.isZoom = true
                self.isZoom2 = false
                newWidth=imgView.frame.width/scale
                newHeight=imgView.frame.height/scale
                imgView.frame.size=CGSize(width: newWidth,height: newHeight)
            }
        
        }
    }

}

