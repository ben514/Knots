//
//  Node.swift
//  Knots
//
//  Created by Ben Choi on 10/7/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import UIKit

class Node: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var associatedPeople = [String]()
    
    var isProfile = false

    var uiImageTitle  = ""
    
    //isProfile
    var name = ""
    var userID = "" //Only for main profile
    var numberOfBonds = 0
    var email = ""
    var birthday = ""

    //isNotProfile
    var imageTitle  = ""
    var comments = [String]()
    var likes = 0
    var descript = ""
    var time = ""
    var location = ""
    
    public func addComments(comment : String) {
        comments.append(comment)
    }
    
    public func likePressed() {
        likes += 1
    }
    
    public func getLikes() -> Int {
        return likes
    }
    public func getComment() -> [String] {
        return comments
    }

    public func getImageTitle() -> String {
        return imageTitle
    }

    public func paint() {
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = frame.size.height/2
        
        
       // imageView.layer.cornerRadius = CGFloat(imageView.frame.size.width/2.0)
        
        Bundle.main.loadNibNamed("Node", owner: self, options: nil)
        
        
        
    }
    
    public func myInit(nam:String, user: String, numBond: Int, birth: String, ema: String) {
        name = nam
        userID = user
        numberOfBonds = numBond
        birthday = birth
        email = ema
        
    }
    
    public func myInit(associatedP:[String], imageT: String, comm: [String], lik: Int, desc: String, tim: String, loc: String) {
        associatedPeople = associatedP
        imageTitle = imageT
        comments = comm
        likes = lik
        descript = desc
        time = tim
        location = loc
    }
    
    
    
    func config(imageName: String, text: String) {
        //set image view
        //set label
    }
}
