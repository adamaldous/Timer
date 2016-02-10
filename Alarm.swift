//
//  Alarm.swift
//  Timer
//
//  Created by Adam Aldous on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import Foundation

class Alarm: NSObject {
    
    static let categoryAlarm = "categoryAlarm"
    static let notificationComplete = "notificationComplete"
    
    private(set) var alarmDate: NSDate?
    private var localNotification: UILocalNotification?
    var isArmed: Bool {
        get {
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    func arm(fireDate: NSDate) {
        alarmDate = fireDate
        let alarmNotification = UILocalNotification()
        alarmNotification.fireDate = alarmDate
        alarmNotification.timeZone = NSTimeZone.localTimeZone()
        alarmNotification.soundName = "sms-received3.caf"
        alarmNotification.alertBody = "Alarm Complete!"
        alarmNotification.category = Alarm.categoryAlarm
        
        UIApplication.sharedApplication().scheduleLocalNotification(alarmNotification)
    }
    
    func cancel() {
        if isArmed {
            alarmDate = nil
            if let localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
    
    static func alarmComplete() {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationComplete, object: nil, userInfo: nil)
    }
}
