//
//  ViewController.swift
//  AlarmUsingAlert
//
//  Created by 문정호 on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:Selector=#selector(ViewController.updateTime)
    let interval=1.0
    var alarmTime:String?
    var alarmOff:Bool!
    
    @IBOutlet var lblCurrentTIme: UILabel!
    @IBOutlet var lblSelectedTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView=sender
        
        let formatter=DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm EEE"
        lblSelectedTime.text="선택시간:"+formatter.string(from: datePickerView.date)
        formatter.dateFormat="hh:mm aaa"
        alarmTime=formatter.string(from: datePickerView.date)
        alarmOff=false
        
    }
    @objc func updateTime(){
        let date=NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTIme.text="현재시간:"+formatter.string(from: date as Date)
        formatter.dateFormat="hh:mm aaa"
        let CurrentTime=formatter.string(from: date as Date)
        if(CurrentTime==self.alarmTime && !alarmOff){
            let alarmAlert=UIAlertController(title: "알림", message: "설정한 시간입니다!!", preferredStyle: UIAlertController.Style.alert)
            
            let acceptAction=UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            alarmAlert.addAction(acceptAction)
            
            present(alarmAlert, animated: true, completion: nil)
            
            alarmOff=true
        }
    }
    

}

