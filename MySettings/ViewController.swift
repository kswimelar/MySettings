//
//  ViewController.swift
//  MySettings
//
//  Created by Kari Swimelar on 12/8/18.
//  Copyright © 2018 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtUserName.text, forKey: "username")
        defaults.set(self.txtPhone.text, forKey: "phone")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(datepicker.date.description)
        defaults.synchronize()
        clear()
        
    }
    
    func clear()
    {
        txtUserName.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults: UserDefaults = UserDefaults.standard
        if defaults.string(forKey: "username") != nil{
            txtUserName.text = defaults.string(forKey: "username")
        }
        
        if defaults.string(forKey: "phone") != nil{
            txtPhone.text = defaults.string(forKey: "phone")
        }
        if defaults.string(forKey: "bdate") != nil{
            let bdate  = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
            let date = dateFormatter.date(from: bdate!) //according to date format your date string
            datepicker.setDate(date!, animated: true)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

