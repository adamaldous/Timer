//
//  TimerViewController.swift
//  Timer
//
//  Created by Adam Aldous on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit


class TimerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pickerStackView: UIStackView!
    
    @IBOutlet weak var hoursPickerView: UIPickerView!
    
    @IBOutlet weak var minutesPickerView: UIPickerView!
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        
        
    }
    
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        
        timerSet()
    }
    
    func timerSet() {
        
        timerLabel.hidden = false
        pickerStackView.hidden = true
    }

}
