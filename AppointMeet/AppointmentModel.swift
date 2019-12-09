//
//  AppointmentModel.swift
//  AppointMeet
//
//  Created by shuayb on 2019-12-08.
//  Copyright © 2019 Mobeen Raza. All rights reserved.
//

import UIKit

class AppointmentModel {
    var DocID: String?
    var Name: String?
    var Day: String?
    var Time: String?
    init(DocID:String?, Name:String?, Day:String?, Time:String) {
        self.DocID = DocID
        self.Name = Name
        self.Day = Day
        self.Time = Time
    }
}
