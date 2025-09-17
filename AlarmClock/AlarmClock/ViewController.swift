//
//  ViewController.swift
//  AlarmClock
//
//  Created by 559 on 9/17/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    var alarmtime: String?
    let timeSelector: Selector = #selector(updateTime)
    let interval = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        let currentTime = formatter.string(from: date as Date)
        
        lblCurrentTime.text = "현재 시간: \(currentTime)"
        
        if let alarm = alarmtime {
            if currentTime == alarm {
                self.view.backgroundColor = UIColor.red
            } else {
                self.view.backgroundColor = UIColor.white
            }
        }
    }
    @IBAction func changeDataPicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        let pickerTime = formatter.string(from: sender.date)
        
        lblPickerTime.text = "선택 시간: \(pickerTime)"
        alarmtime = pickerTime
    }
}

