//
//  signUpVc.swift
//  softsInstagram
//
//  Created by Walid Sassi on 22/12/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class signUpVc: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var avaImg: UIImageView!
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var repeatpasswordTxt: UITextField!
    
    @IBOutlet var fullnameTxt: UITextField!
    @IBOutlet var bioTxt: UITextField!
    @IBOutlet var webTxt: UITextField!
    
    
    var scrollViewHeight : CGFloat = 0
    
    var keyborad = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func cancel(_ sender: AnyObject) {
        self.dismiss(animated:
            true, completion: nil)
    }
    @IBAction func signin(_ sender: AnyObject) {
        print ("sign up pressed")
    }
    

}
