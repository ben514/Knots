//
//  PhotoViewController.swift
//  Knots
//
//  Created by Ben Choi on 10/8/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var backgroundImage: UIImage
    
    init(image: UIImage) {
        self.backgroundImage = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        let backgroundImageView = UIImageView(frame: view.frame)
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView.image = backgroundImage
        view.addSubview(backgroundImageView)
        let cancelButton = UIButton(frame: CGRect(x: 10.0, y: 10.0, width: 30.0, height: 30.0))
        cancelButton.setImage(#imageLiteral(resourceName: "cancel"), for: UIControlState())
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
//        let sendButton = UIButton(frame: CGRect(x: view.frame.maxX - 50, y: view.frame.maxY - 50, width: 30, height: 30))
//        sendButton.setTitle("➤", for: .normal)
//        sendButton.titleLabel?.font = UIFont(name: "System", size: CGFloat(30))
//        sendButton.addTarget(self, action: #selector(goToSearch), for: .touchUpInside)
//        view.addSubview(sendButton)
    }
    
    func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    func goToSearch() {
        let searchViewController = SearchViewController()
       // let navigationVC = UINavigationController(rootViewController: searchViewController)
        self.present(searchViewController, animated: true, completion: nil)
    }
 */
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SearchViewController {
            //Make the circular transition enabled
            vc.transitioningDelegate = self
            vc.modalPresentationStyle = .fullScreen
            
            //Give ipAddress and port to the remoteViewController

        }
    }*/
}
