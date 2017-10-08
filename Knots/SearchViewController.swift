//
//  SearchViewController.swift
//  Knots
//
//  Created by Ben Choi on 10/8/17.
//  Copyright © 2017 Jamin514. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource , UIImagePickerControllerDelegate, UITableViewDelegate,
UINavigationControllerDelegate, UIViewControllerTransitioningDelegate{

    @IBOutlet weak var searchList: UITableView!
    @IBOutlet weak var search: UITextField!
    var input : String = ""
    let picker = UIImagePickerController()
    var copyPpl = [String]()
    var resultPpl = [String]()
    var pplLst = [People]()
    var chosenOne = 0
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        self.search.delegate = self
        searchList.dataSource = self
        
        for p in ppl {
            copyPpl.append(p)
        }
        // Do any additional setup after loading the view.
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let temp = search.text {
            input = temp
        }
        
        for p in ppl {
            if(input == p){
                resultPpl.append(input)
                //p.addPhoto(daPicture)
            }
        }
        copyPpl = resultPpl
        searchList.reloadData()
        return true
    }
    
    @IBAction func dismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
   

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
       // ppl[chosenOne].addNode(Node(chosenImage))
        dismiss(animated:true, completion: nil) //5
    }
    
    //TABLE VIEW STUFF
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return copyPpl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let text = copyPpl[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
        //chosenOne = indexPath.row.index
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
