//
//  ViewController.swift
//  DatePickerAlarm
//
//  Created by 문정호 on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector=#selector(ViewController.updateTime)
    let interval = 1.0
    var count=0
    var alarmTime:String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView=sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text="선택 시간: "+formatter.string(from: datePickerView.date)
        
        formatter.dateFormat="hh:mm aaa"
        alarmTime=formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        lblCurrentTime.text=String(count)
//        count=count+1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text="현재시간: "+formatter.string(from: date as Date)
        
        formatter.dateFormat="hh:mm aaa"
        let currentTime=formatter.string(for: date)
        if(currentTime==alarmTime){
            view.backgroundColor=UIColor.red
        }
        else{
            view.backgroundColor=UIColor.white
        }
    }

}

