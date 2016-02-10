//
//  AlarmViewController.swift
//  Timer
//
//  Created by Adam Aldous on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var alarmDatePicker: UIDatePicker!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var alarmButton: UIButton!
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    override func viewWillAppear(animated: Bool) {
        
        alarmDatePicker.minimumDate = NSDate()
    }
    
    
    @IBAction func alarmButtonPressed(sender: AnyObject) {
        
        if alarm.isArmed {
            switchToAlarmNotSetView()
            alarm.cancel()
        } else {
            armAlarm()
        }
    }
    
    func armAlarm() {
        alarm.arm(alarmDatePicker.date)
        switchToAlarmSetView()
    }
    
    func switchToAlarmSetView() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .LongStyle
        
        if let date = alarm.alarmDate {
            dateLabel.text = dateFormatter.stringFromDate(date)
            datePicker.date = date
        } else {
            dateLabel.text = ""
        }
        
        messageLabel.text = "Your alarm is set!"
        dateLabel.text =
        dateLabel.hidden = false
        alarmButton.setTitle("Cancel", forState: .Normal)
        
    }
    
    func switchToAlarmNotSetView() {
        
        messageLabel.text = "Your alarm is set!"
        dateLabel.hidden = true
        alarmButton.setTitle("Set Alarm", forState: .Normal)
    }
    
    
}
