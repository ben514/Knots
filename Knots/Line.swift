//
//  Line.swift
//  Knots
//
//  Created by Ben Choi on 10/7/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import UIKit

class Line {
    var center1 = CGPoint(x: 0, y: 0)
    var center2 = CGPoint(x: 0, y: 0)
    
    init(p1: CGPoint,size1:Int, p2: CGPoint, size2:Int) {
        center1 = CGPoint(x: Double(p1.x), y: Double(p1.y) )
        center2 = CGPoint(x: Double(p2.x), y: Double(p2.y) )
    }
    
    
}
