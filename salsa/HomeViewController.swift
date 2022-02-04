//
//  ViewController.swift
//  salsa
//
//  Created by Archmage IMac2 on 6/13/19.
//  Copyright © 2019 Archmage Solutions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if self.revealViewController() != nil {
            
            menu.addTarget(self.revealViewController(), action: "revealToggle:", for: .touchUpInside)
            
            self.revealViewController()?.rightViewRevealWidth = 100
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }


}

