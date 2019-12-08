//
//  DoctorTableViewCell.swift
//  AppointMeet
//
//  Created by shuayb on 2019-12-07.
//  Copyright © 2019 Mobeen Raza. All rights reserved.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblProf : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
