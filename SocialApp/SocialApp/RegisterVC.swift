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
            
            //url to php file
            let url = NSURL(string: "http://localhost/SocialApp/register.php")!
            
            //request to this file
            let request = NSMutableURLRequest(URL: url)
            
            //method to pass data to this file (e.g. via POST)
            request.HTTPMethod = "POST"
            
            //body to be appended to url
            let body = "username=\(usernameText.text!.lowercaseString)&password=\(passwordText.text!)&email=\(emailText.text!)&fullname=\(firstnameText.text!)%20\(lastnameText.text!)"
            request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
            
            // proceed request
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) in
                
                if error == nil {
                    
                    // get main queue in code process to communicate back to UI
                    dispatch_async(dispatch_get_main_queue(), {
                        do {
                            //get json result
                            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                            
                            //assign json to new var parseJSON in guard/secured way
                            guard let parseJSON = json else {
                                print("Error while parsing")
                                return
                            }
                            
                            //get id from parseJSON dictionary
                            let id = parseJSON["id"]
                            
                            //if there is some id value
                            if id != nil {
                                print(parseJSON)
                            }
                            
                        } catch {
                            print("Caught an error: \(error)")
                        }
                        
                    })
                    
                //if unable to proceed request
                } else {
                    print("error: \(error)")
                }
            
            //launch prepared session
            }).resume()
        }
    }
    
}

