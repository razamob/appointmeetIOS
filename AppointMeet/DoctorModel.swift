//
//  DoctorModel.swift
//  AppointMeet
//
//  Created by shuayb on 2019-12-07.
//  by shuayb badoolah
//

import UIKit

class DoctorModel {
    var DocID: String?
    var Name: String?
    var Profession: String?
    init(DocID:String?, Name:String?, Profession:String?) {
        self.DocID = DocID
        self.Name = Name
        self.Profession = Profession
    }
}
