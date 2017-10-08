//
//  People.swift
//  Knots
//
//  Created by Ben Choi on 10/8/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import Foundation


class People {
    
    var imageTitle  = ""
    var comments = ""
    var likes = 0
    var descript = ""
    var time = ""
    var location = ""
    
    var isProfile = false
    
    //isProfile
    var name = ""
    var userID = "" //Only for main profile
    var numberOfBonds = 0
    var email = ""
    var birthday = ""
    
    init(imT:String, comm:String, lik: Int, desc: String, tim: String, loc: String) {
        imageTitle = imT
        comments = comm
        likes = lik
        descript = desc
        time = tim
        location = loc
    }
    
    init (nam:String, user: String, numBond: Int, birth: String, ema: String) {
        name = nam
        userID = user
        numberOfBonds = numBond
        birthday = birth
        email = ema
        !isProfile
    }
    
}
