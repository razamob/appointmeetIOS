//
//  BookingViewController.swift
//  AppointMeet
//
//  Created by shuayb on 2019-12-07.
//  Copyright © 2019 Mobeen Raza. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    var docName = ""
    @IBOutlet var lblName : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = docName

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
