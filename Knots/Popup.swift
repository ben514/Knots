//
//  Popup.swift
//  Knots
//
//  Created by Ben Choi on 10/7/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import UIKit

class Popup: UIView  {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
        
    var node: Node = Node(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var people: People = People(imT: "", comm: "", lik: 0, desc: "", tim: "", loc: "")
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /*
    public func myInit(image : String, likes : Int) {
        imageView.image = UIImage(named:image)
        numLikes = likes
        likeCount.text = String(likes)
    }
 */
    public func myInit(_ n: Node, _ p: People) {
        node = n
        imageView.image = UIImage(named: node.uiImageTitle)
        likeCount.text = String(node.getLikes())
        
        if (people.isProfile) {
            titleLabel.text = people.name
            timeLabel.text = people.birthday
            locationLabel.text = people.email
            textView.text = "Number of bonds: \(people.numberOfBonds)\n"
        }
        else {
            titleLabel.text = node.imageTitle
            timeLabel.text = node.time
            locationLabel.text = node.location
            textView.text = people.comments
        }
        addSubview(contentView)

    }
    
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Popup", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func config(imageName: String, text: String) {
    }
    
    @IBAction func like(_ sender: Any) {
        node.likes += 1
        likeCount.text = String(node.likes)

    }
    
}
