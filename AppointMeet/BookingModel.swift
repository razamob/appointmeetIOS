//
//  BookingModel.swift
//  AppointMeet
//
//  Created by shuayb on 2019-12-09.
//  Copyright © 2019 Mobeen Raza. All rights reserved.
//

import UIKit

class BookingModel {
    var UserEmail: String?
    var Booking: String?

    init(UserEmail:String?, Booking:String?) {
        self.UserEmail = UserEmail
        self.Booking = Booking

    }
}
