//
//  Event_TableViewController.swift
//  salsa
//
//  Created by Ranula Ranatunga on 6/19/19.
//  Copyright © 2019 Ranula Ranatunga. All rights reserved.
//

import UIKit

class Event_TableViewController: UITableViewController {
    
    
    var month = ["JUN" ,"JUN" ,"JUN"]
    
    var day = ["13" ,"17" ,"18"]
    
    var club_type = ["Beginners Salsa Dance Class Old Havana Cadiff" ,"Bachata Class-Old Havana Cardiff with Havana People" ,"Newport- Cuban Salsa Class with Havana People"]
    
    var shedule = ["Thursday,June 13,2019 at 6PM - 9PM UTC+01 " ,"Monday, June 17,2019 at 7.30 PM - 9.30 PM" ,"Tuesday,June 18,2019 at 7.30 PM - 10 PM"]
    
    var place = ["Old Havana - Cardiff 6,High Street, CF10 1AW Cardiff " , "Old Havana - Cardiff 6 , High Street,CF10 1AW Cardiff " , "The Courtyard,Newport 46 Cambrian Road,NP20 4AB Newport,Wales" ]
    
    var menu_Button:UIButton!
    var label:UILabel!
    var event = Event()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var cals : [Calendar] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // If no further params are supplied, only `uid` and `dtstamp` are set.
       //        event.summary = "Awesome event"
       //        print(event) // 20160513T003222+0200: Awesome event!
        
        let calendar = Calendar(withComponents: [event])
        
        let iCalString = calendar.toCal()
        
        let url = URL(string: "https://archdemo.info/events/havana.ics")!
        cals = try! iCal.load(url: url)
        
        
        // or loadFile() or loadString(), all of which return [Calendar] as an ics file can contain multiple calendars
        print(cals[0])
        print("***********************************************************************")
        print(cals[0].subComponents[0])
        print("***********************************************************************")
        print(cals[0].subComponents[1])
        print("***********************************************************************")
        print(cals[0].subComponents[2])
        print("***********************************************************************")
        print (cals[0].subComponents[3])
        print ("**********************************************************************")
        print (cals[0].subComponents[4])
        print ("**********************************************************************")
        
//        for cal in cals {
//
//            for event in cal.subComponents where event is Event {
//
//            //
//              //  event["]
////                print("Here we  come....")
////                print(event.toCal())
//
//            }
//        }
        

        tableView.backgroundView = UIImageView(image: UIImage(named: "event_bg.png"))
        let grayscale_bg = UIImage(named: "event_bg.png")
        let event_bg = UIImageView(image: grayscale_bg)
        event_bg.contentMode = .scaleAspectFill
        
        screenSize = UIScreen.main.bounds
        screenWidth  = screenSize.width
        screenHeight = screenSize.height
        
       
//        let image = UIImage(named: "event_bg.png")
//        let iv = UIImageView(image: image)
//        iv.contentMode = .scaleAspectFill
//        iv.layer.frame = CGRect(x: self.view.frame.midX, y:       self.view.frame.midY, width: 414, height: 896)
//        let tableViewBackgroundView = UIView()
//        tableViewBackgroundView.addSubview(iv)
//        self.tableView.backgroundView = tableViewBackgroundView
        
        
//        Menu_Button = UIButton()
//        Menu_Button.frame = CGRect(x: 350.0, y: screenHeight/2, width: 10.0, height: 200.0)
//      Menu_Button.center = self.view.center
//        Menu_Button.setTitle("", for: UIControl.State.normal)
//        Menu_Button.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        Menu_Button.backgroundColor = UIColor.red
        
//        Menu_Button.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor, constant: screenWidth/2).isActive = true
//        Menu_Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: screenHeight/2).isActive = true
//        Menu_Button.heightAnchor.constraint(equalToConstant: 100.0)
//        Menu_Button.widthAnchor.constraint(equalToConstant: 10.0)
        
      
        let menu_Button = UIButton()
        let bgimage = UIImage(named: "Menu.png")
        
//      menu_Button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        menu_Button.setImage(bgimage, for: UIControl.State.normal)
        menu_Button.setTitle("", for: .normal)
        
        view.addSubview(menu_Button)
        
        
        // set position
        menu_Button.translatesAutoresizingMaskIntoConstraints = false
        menu_Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: (screenHeight/2)-50).isActive = true
//      menu_Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:).isActive = true
       
        
        menu_Button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor , constant: 210).isActive = true
        menu_Button.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 70).isActive = true
        menu_Button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        menu_Button.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        if self.revealViewController() != nil {
            
            menu_Button.addTarget(self.revealViewController(), action: "revealToggle:", for: .touchUpInside)
            
            self.revealViewController()?.rearViewRevealWidth = 300
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    
//        self.tableView.addSubview(menu_Button)
        
    }
    
   
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return day.count
        
        return cals[0].subComponents.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360.0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Event_Cell", for: indexPath) as! EventItemTableViewCell
        
        var eventstring = cals[0].subComponents[indexPath.row]
        
        print("*******************************************---------------------------******************************")
        print(eventstring)
        print("*******************************************---------------------------******************************")
        
//        cell.Month.text = month[indexPath.row]
//
//        cell.Day.text = day[indexPath.row]
        
        var lines = eventstring.toCal().components(separatedBy: CharacterSet.newlines)
        
        var day = convertDateFormatter(date: lines[2].components(separatedBy: ":")[1], type: 2)
        var month = convertDateFormatter(date: lines[2].components(separatedBy: ":")[1], type: 1)
        var fulldate = convertDateFormatter(date: lines[2].components(separatedBy: ":")[1], type: 0)

        
        print("**********************************")
        print(lines[0])
        print(lines[1])
        print(lines[2])
        print(lines[3])
        print(lines[4])
        print(lines[5])
        print(lines[6])
        print(lines[7])
        
        print("**********************************")

        
        var value:String = lines[3]
        
        cell.Club_Type.text = value.components(separatedBy: ":")[1]
        cell.Day.text = day
        cell.Month.text = month
        cell.Shedule.text = fulldate

        cell.View.layer.borderColor = UIColor(red: 1, green: 0.4, blue: 0.1686, alpha: 1.0).cgColor
        cell.View.layer.borderWidth = 1

        cell.View.layer.shadowOffset = CGSize(width: -1, height: 1)

        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
   //     cell.layer.borderColor = UIColor(red: 1, green: 0.4, blue: 0.1686, alpha: 1.0).cgColor
    //    cell.layer.shadowOffset = CGSize(width: -1, height: 1)
//
        return cell
        
    }
    
    func convertDateFormatter(date: String, type : Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"//this your string date format
        let convertedDate = dateFormatter.date(from: date)

        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }

        if(type == 0){
            dateFormatter.dateFormat = "EEEE, MMM dd, yyyy HH:mm "///this is what you want to convert format
        } else if(type == 1){
            dateFormatter.dateFormat = "MMM"///this is what you want to convert format
        }else if(type == 2){
            dateFormatter.dateFormat = "dd"///this is what you want to convert format
        }

        let timeStamp = dateFormatter.string(from: convertedDate!)

        return timeStamp
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
