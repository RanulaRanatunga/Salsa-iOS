//
//  EventItemTableViewCell.swift
//  salsa
//
//  Created by Ranula Ranatunga on 6/19/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class EventItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var View: UIView!
    @IBOutlet weak var Month: UILabel!
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var Shedule: UILabel!
    @IBOutlet weak var Shedule_Icon: UIImageView!
    @IBOutlet weak var Club_Type: UILabel!
    @IBOutlet weak var Place: UILabel!
    @IBOutlet weak var Place_Icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    
        
        
    }

}
