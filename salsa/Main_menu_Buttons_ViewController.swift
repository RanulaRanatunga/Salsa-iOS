//
//  Main_menu_Buttons_ViewController.swift
//  salsa
//
//  Created by Archmage IMac2 on 6/14/19.
//  Copyright © 2019 Archmage Solutions. All rights reserved.
//

import UIKit

class Main_menu_Buttons_ViewController: UIViewController {

    @IBAction func Home_Menu_Button(_ sender: Any) {
    }
   
    @IBOutlet weak var instagramGallery: UIButton!
    
    @IBAction func instagramGallery(_ sender: Any) {
        
//        let urlStr: String = "instagram://user?username=HappyGOLUCKY"
//
//        let url = URL(string: urlStr)
//
//        if UIApplication.shared.canOpenURL(url!) {
//
//            print("can open")
//
//            if #available(iOS 10.0, *) {
//
//                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//
//            } else {
//
//                UIApplication.shared.openURL(url!)
//
//            }
//
//        }
        
        let Username =  "havanapeoplesalsa"
        let appURL = URL(string: "instagram://havanapeoplesalsa")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
           
            let webURL = URL(string: "https://www.instagram.com/havanapeoplesalsa/")!
            application.open(webURL)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
