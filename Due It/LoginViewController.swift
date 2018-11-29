//
//  LoginViewController.swift
//  Due It
//
//  Created by Rebecca Raab on 11/28/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
//variables and funcitons for creating user login
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var createButton: UIButton!
    //Create Account Function
    @IBAction func CreateAccount(_ sender: Any) {
        
        if let email=Username.text, let password=Password.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                
                //error
                if let firebaseError=error{
                    print(firebaseError.localizedDescription)
                    return
                }
                //account created
                print("Success")
                self.goToApp()
            }
        }
    }
    @IBOutlet weak var loginButton: UIButton!
    //Login Function
    @IBAction func Login(_ sender: Any) {
        if let email=Username.text, let password=Password.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                //error
                if let firebaseError=error{
                    print(firebaseError.localizedDescription)
                    return
                }
                //no error
                print("success")
                self.goToApp()
            }

        }
    }
    
    override func viewDidLoad() {
        
    }
    override func didReceiveMemoryWarning() {
        
    }
    
    func goToApp(){
        let storyboard:UIStoryboard=UIStoryboard(name:"Main", bundle:nil)
        let viewController:ViewController=storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
  
}
