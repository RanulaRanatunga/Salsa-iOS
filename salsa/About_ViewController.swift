//
//  About_ViewController.swift
//  salsa
//
//  Created by Archmage IMac2 on 6/14/19.
//  Copyright © 2019 Archmage Solutions. All rights reserved.
//

import UIKit

class About_ViewController: UIViewController {

    
    @IBOutlet weak var Menu_Back_Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            
         Menu_Back_Button.addTarget(self.revealViewController(), action: "revealToggle:", for: .touchUpInside)
        
            
            self.revealViewController()?.rearViewRevealWidth = 300
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
