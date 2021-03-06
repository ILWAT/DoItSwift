//
//  EditViewController.swift
//  NavigationMission
//
//  Created by 문정호 on 2022/02/15.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swisOn: UISwitch!
    @IBOutlet var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swisOn.isOn = isOn
        if !isZoom {
            btnZoom.setTitle("축소", for: .normal)
        }
        else{
            btnZoom.setTitle("확대", for: .normal)
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnIsZoom(_ sender: UIButton) {
        if isZoom{
            btnZoom.setTitle("축소", for: .normal)
            self.isZoom = false
        }
        else{
            btnZoom.setTitle("확대", for: .normal)
            self.isZoom = true
        }
        
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }
        else{
            isOn = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
