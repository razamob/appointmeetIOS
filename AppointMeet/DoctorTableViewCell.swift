//
//  DoctorTableViewCell.swift
//  AppointMeet
//
//  By shuayb badoolah  
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
