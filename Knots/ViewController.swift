//
//  ViewController.swift
//  Knots
//
//  Created by Ben Choi on 10/7/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import UIKit

var ppl = ["John Kerns", "Hannah Morrison",
           "Ben Choi", "Minty Kim"]

var people = [People]()


class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scroll: UIScrollView!
    
    var nodes: [Node] = [Node]()
        
    var dict = [Int: Node]()
   
    
    
    
    var line1 = Line(p1: CGPoint(x:0,y:0), size1: 0, p2: CGPoint(x:0,y:0), size2: 0)
    
    let sizeMain = 150
    let sizeOther = 100
    
    var longTalk = LongNiceTalk()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Zooming max and min
        scroll.minimumZoomScale = 1.0
        scroll.maximumZoomScale = 4.0
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let gr2 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let gr3 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let gr4 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        let gr5 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
         let gr6 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
         let gr7 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))

        let view1 = Node(frame: CGRect(x: (view.frame.size.width * 10)/2.0, y: (view.frame.size.height * 10)/2, width: 150, height: 150))
        nodes.append(view1)
        view1.tag = 0
        var view1Title = "Ben1"
        
        
        view1.imageView.image = UIImage(named: view1Title)
        view1.imageTitle = view1Title
        view1.associatedPeople.append(ppl[2])
        view1.addGestureRecognizer(gr)
        people.append(People(nam: "Ben Choi", user: "bchoi14", numBond: 3, birth: "05/14/1998", ema: "bchoi12@igl.aje"))
        
        let view2 = Node(frame: CGRect(x: (view.frame.size.width * 11)/2.0, y: (view.frame.size.height * 11)/2, width: 90, height: 90))
        nodes.append(view2)
        var view2Title = "Minty1"
        view2.tag = 1
        view2.imageView.image = UIImage(named: view2Title)
        view2.imageTitle = view2Title
        view2.associatedPeople.append(ppl[3])
        view2.addGestureRecognizer(gr2)
        people.append(People(nam: "Minty Kim", user: "minty291", numBond: 10, birth: "08/29/1998", ema: "Minty14@gmail.com"))
        
        let view3 = Node(frame: CGRect(x: (view.frame.size.width * 10)/2.0, y: (view.frame.size.height * 10.5)/2, width: 100, height: 100))
        nodes.append(view3)
        var view3Title = "BenAndMinty"
        view3.tag = 2
        view3.imageView.image = UIImage(named: view3Title)
        view3.imageTitle = view3Title
        view3.associatedPeople.append(ppl[2])
        view3.associatedPeople.append(ppl[3])
        view3.addGestureRecognizer(gr3)
        people.append(People(imT: "Best Friends Forever", comm: longTalk.longSpeech[0], lik: 200, desc: "", tim: "06/12/1999", loc: "MyOriginalHome"))
        
        let view4 = Node(frame: CGRect(x: (view.frame.size.width * 11.4)/2.0, y: (view.frame.size.height * 9.9)/2, width: 100, height: 100))
        nodes.append(view4)
        var view4Title = "John1"
        view4.tag = 3
        view4.imageView.image = UIImage(named: view4Title)
        view4.imageTitle = view4Title
        view4.associatedPeople.append(ppl[0])
        view4.addGestureRecognizer(gr4)
        people.append(People(nam: "John Kerns", user: "JKern13", numBond: 23, birth: "02/14/1999", ema: "johnE21@gmail.com"))
//
        let view5 = Node(frame: CGRect(x: (view.frame.size.width * 11)/2.0, y: (view.frame.size.height * 10.5)/2, width: 100, height: 100))
        nodes.append(view5)

        var view5Title = "Ben2"
        view5.tag = 4
        view5.imageView.image = UIImage(named: view5Title)
        view5.imageTitle = view5Title
        view5.associatedPeople.append(ppl[2])
        view5.addGestureRecognizer(gr5)
        people.append(People(imT: "My Blunder Years", comm: longTalk.longSpeech[1], lik: 512, desc: "", tim: "05/14/2015", loc: "Irvine CA"))
//
        let view6 = Node(frame: CGRect(x: (view.frame.size.width * 9.0)/2.0, y: (view.frame.size.height * 10.7)/2, width: 100, height: 100))
        nodes.append(view6)

        var view6Title = "Ben3"
        view6.tag = 5
        view6.imageView.image = UIImage(named: view6Title)
        view6.imageTitle = view6Title
        view6.associatedPeople.append(ppl[2])
        view6.addGestureRecognizer(gr6)
        people.append(People(imT: "Unforgettable Moments", comm: longTalk.longSpeech[2], lik: 22, desc: "", tim: "03/14/2017", loc: "Berkeley CA"))
//
        let view7 = Node(frame: CGRect(x: (view.frame.size.width * 8.5)/2.0, y: (view.frame.size.height * 9.9)/2, width: 100, height: 100))
        nodes.append(view7)

        var view7Title = "Hannah1"
        view7.tag = 6
        view7.imageView.image = UIImage(named: view7Title)
        view7.imageTitle = view7Title
        view7.associatedPeople.append(ppl[1])
        view7.addGestureRecognizer(gr7)
        people.append(People(nam: "Hannah Morrison", user: "hMorrison13", numBond: 203, birth: "02/29/1980", ema: "morrison142@iag.edu"))
        
        dict[0] = view1
        dict[1] = view2
        dict[2] = view3
        
        
        print(dict[0]!.frame.midX)
//        line1 = Line(p1: CGPoint(x:dict[0]!.frame.midX, y:dict[0]!.frame.midY), size1: sizeMain, p2: CGPoint(x:dict[1]!.frame.midX, y:dict[1]!.frame.midY), size2: sizeOther)
//        addLine(fromPoint: line1.center1, toPoint: line1.center2)
        
        
        
        var line2 = Line(p1: CGPoint(x:view1.frame.midX, y:view1.frame.midY), size1: sizeMain, p2: CGPoint(x:view3.frame.midX, y:view3.frame.midY), size2: 100)
        addLine(fromPoint: line2.center1, toPoint: line2.center2)
        
       
        
        var line3 = Line(p1: CGPoint(x:view2.frame.midX, y:view2.frame.midY), size1: 130, p2: CGPoint(x:view3.frame.midX, y:view3.frame.midY), size2: 100)
        addLine(fromPoint: line3.center1, toPoint: line3.center2)
        
        var line4 = Line(p1: CGPoint(x:view1.frame.midX, y:view1.frame.midY), size1: 130, p2: CGPoint(x:view5.frame.midX, y:view5.frame.midY), size2: 100)
        addLine(fromPoint: line4.center1, toPoint: line4.center2)
        
        var line5 = Line(p1: CGPoint(x:view4.frame.midX, y:view4.frame.midY), size1: 130, p2: CGPoint(x:view5.frame.midX, y:view5.frame.midY), size2: 100)
        addLine(fromPoint: line5.center1, toPoint: line5.center2)
        
        var line6 = Line(p1: CGPoint(x:view1.frame.midX, y:view1.frame.midY), size1: 130, p2: CGPoint(x:view6.frame.midX, y:view6.frame.midY), size2: 100)
        addLine(fromPoint: line6.center1, toPoint: line6.center2)
        
        var line7 = Line(p1: CGPoint(x:view6.frame.midX, y:view6.frame.midY), size1: 130, p2: CGPoint(x:view7.frame.midX, y:view7.frame.midY), size2: 100)
        addLine(fromPoint: line7.center1, toPoint: line7.center2)
        
        view1.paint()
        scroll.addSubview(view1)
        view2.paint()
        scroll.addSubview(view2)
        view3.paint()
        scroll.addSubview(view3)
        view4.paint()
        scroll.addSubview(view4)
        view5.paint()
        scroll.addSubview(view5)
        view6.paint()
        scroll.addSubview(view6)
        view7.paint()
        scroll.addSubview(view7)

        
        scroll.contentSize = CGSize(width: view.frame.size.width * 10, height: view.frame.size.height * 10)
        scroll.contentOffset.x = scroll.contentSize.width/2
        scroll.contentOffset.y = scroll.contentSize.height/2

        
    }
    
    func viewTapped(_ sender: UITapGestureRecognizer) {
        let tag = sender.view!.tag
        print("view tapped with tag \(tag)")
        //show popup here:
        //let testView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        let myPopup = Popup(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myPopup.myInit(nodes[tag],people[tag])
        myPopup.imageView.image = UIImage(named:nodes[tag].imageTitle)
        myPopup.textView.text = people[tag].comments
        
        
        let popupView = EasyPopup(frame: view.frame, contentView: myPopup)
        popupView.heightPopPourcent = 90
        popupView.widthPopPourcent = 90
        view.addSubview(popupView)
        popupView.start()
        
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 2
        line.lineJoin = kCALineJoinRound
        scroll.layer.insertSublayer(line, below: scroll.layer)
        
        
        //scroll.addSubview(line)
        //addSubview(contentView)
        //contentView.frame = self.bounds
        //contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}

