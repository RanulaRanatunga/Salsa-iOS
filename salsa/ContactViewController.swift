//
//  ContactViewController.swift
//  salsa
//
//  Created by Ranula Janath Ranatunga on 6/17/19.
//  Copyright © 2019 Ranula Janath Ranatunga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ContactViewController: UIViewController {

    @IBOutlet weak var Menu_Back_Button: UIButton!
    @IBOutlet weak var Name_TextField: UITextField!
   
    @IBOutlet weak var EMail_TextField: UITextField!
    
    @IBOutlet weak var Submit_Button: UIButton!
    @IBOutlet weak var Message_TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        
        if self.revealViewController() != nil {
            
            Menu_Back_Button.addTarget(self.revealViewController(), action: "revealToggle:", for: .touchUpInside)
            
            
            self.revealViewController()?.rearViewRevealWidth = 300
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        Submit_Button.layer.cornerRadius = 5
        Submit_Button.layer.borderWidth = 1.5
        let orange_colour : UIColor = UIColor(red: 1, green: 0.4, blue: 0.1686, alpha:1.0)
        Submit_Button.layer.borderColor = orange_colour.cgColor
        
        Name_TextField.layer.cornerRadius = 5
        Name_TextField.layer.borderWidth = 1
        let light_orange : UIColor = UIColor(red: 0.9608, green: 0.8863,blue:0.7765,alpha: 1.0)
        Name_TextField.layer.borderColor = light_orange.cgColor
        
        EMail_TextField.layer.cornerRadius = 5
        EMail_TextField.layer.borderWidth = 1
        EMail_TextField.layer.borderColor = light_orange.cgColor
        
        
        Message_TextField.layer.cornerRadius = 5
        Message_TextField.layer.borderWidth = 1
        Message_TextField.layer.borderColor = light_orange.cgColor

        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
        let parameters: Parameters = [
            "name":self.Name_TextField.text!,
            "message": self.Message_TextField.text!,
            "email":self.EMail_TextField.text!
        ]

        Alamofire.request("https://testapi-arch.herokuapp.com/api/v1/email/create-email", method: .post, parameters: parameters,encoding: URLEncoding()).responseJSON { response in
            if let value = response.result.value {
                
                let result = JSON(value)
                
                print(value)
   
                
            } else{
                print("errorrrrrrrrrr")

            }
            
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
