//
//  ViewController.swift
//  MySettings
//
//  Created by Michael Kazmerski on 10/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFullname: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPin: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
            defaults.set(self.txtFullname.text, forKey: "fullname")
            defaults.set(self.txtEmail.text, forKey: "email")
            defaults.set(self.txtPhone.text, forKey: "phone")
            defaults.set(self.txtPassword.text, forKey: "password")
            defaults.set(self.txtPin.text, forKey: "pin")
              let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
            defaults.set(newDate, forKey: "bdate")
            print(datepicker.date.description)
            defaults.synchronize()
            clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
              if defaults.string(forKey: "fullname") != nil{
                    txtFullname.text = defaults.string(forKey: "fullname")
              }
              if defaults.string(forKey: "email") != nil{
                  txtEmail.text = defaults.string(forKey: "email")
              }
              if defaults.string(forKey: "phone") != nil{
            txtPhone.text = defaults.string(forKey: "phone")
              }
            if defaults.string(forKey: "password") != nil{
            txtPassword.text = defaults.string(forKey: "password")
              }
            if defaults.string(forKey: "pin") != nil{
            txtPin.text = defaults.string(forKey: "pin")
            }
              if defaults.string(forKey: "bdate") != nil{
                  let bdate  = defaults.string(forKey: "bdate")
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                  let date = dateFormatter.date(from: bdate!) //according to date format your date string
                  datepicker.setDate(date!, animated: true)
    }


}
    func clear()
    {
     txtEmail.resignFirstResponder()
        txtFullname.resignFirstResponder()
        txtPhone.resignFirstResponder()
        txtPassword.resignFirstResponder()
        txtPin.resignFirstResponder()
     }
}
