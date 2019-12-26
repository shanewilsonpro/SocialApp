//
//  ViewController.swift
//  SocialApp
//
//  Created by Shane Wilson on 11/27/19.
//  Copyright © 2019 Shane Wilson. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var firstnameText: UITextField!
    @IBOutlet var lastnameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerClick(_ sender: Any) {
        
        // if no text
        if usernameText.text!.isEmpty || passwordText.text!.isEmpty || emailText.text!.isEmpty || firstnameText.text!.isEmpty || lastnameText.text!.isEmpty {
            
            // red placeholders
            usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            firstnameText.attributedPlaceholder = NSAttributedString(string: "firstname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            lastnameText.attributedPlaceholder = NSAttributedString(string: "lastname", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        
        //if the text is entered
        } else {
            
            //create new user in mySQL
            
        }
    }
    
}

