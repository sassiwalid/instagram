//
//  ViewController.swift
//  softsInstagram
//
//  Created by Walid Sassi on 20/12/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {

  
    @IBOutlet var picture: UIImageView!
    @IBOutlet var senderLbl: UILabel!
    @IBOutlet var receiverLbl: UILabel!
    @IBOutlet var messageLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Store Data in Heroku Server
        /*let data = UIImageJPEGRepresentation(picture.image!,0.5)
        let file = PFFile(name: "logo.jpg", data: data!)
        let table = PFObject(className: "messages")
        table["sender"]="walid"
        table["receiver"] = "yahya"
        table["message"] = "hello yahya"
        table["picture"] = file
        table.saveInBackground()*/
        // Get data from Heroku
        let information = PFQuery(className: "messages")
        information.findObjectsInBackground { (objects:[PFObject]?, error:Error?) in
            if error == nil {
                // get data from messages table (collection)
                for object in objects!{
                    let message = object["message"] as! String
                    let sender = object["sender"] as! String
                    let receiver = object["receiver"] as! String
                    self.messageLbl.text = "Message :  \(message)"
                    self.senderLbl.text = "Sender : \(sender) "
                    self.receiverLbl.text = "Receiver : \(receiver) "
                    // in swift 3
                    if let imageFromParse = object.object(forKey: "picture") as? PFFile {
                        imageFromParse.getDataInBackground(block: {
                            (data: Data?, error: Error?) in
                            
                            if error == nil {
                                if data != nil {
                                    self.picture.image = UIImage(data: data!)
                                }
                                else{
                                    print(error)
                                }
                            }
                        })
                        
                    }
                    
                }
                
                
            }
            else{
                print(error)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

