//
//  LoginViewController.swift
//  Due It
//
//  Created by Rebecca Raab on 11/28/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    var ref: DatabaseReference!
    var tasks = [String]();
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
                
                
                //database ref
                let ref=Database.database().reference()
                //let userRef=ref.child("users")
                let userRef = ref.child("users").child(user!.user.uid)
                userRef.setValue(["email":email])


                //go to to due list screen
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
                

                
                //go to to due list screen
                self.goToApp()
            }

        }
    }
    
    override func viewDidLoad() {
        
    }
    override func didReceiveMemoryWarning() {
        
    }
    
    //Go to the to DUE list screen
    func goToApp(){
        let storyboard:UIStoryboard=UIStoryboard(name:"Main", bundle:nil)
        let viewController:ViewController=storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(viewController, animated: true, completion: nil)
        //raab
        let dRef = Database.database().reference()
        //let tName: String = input.text!
        
        let userID = Auth.auth().currentUser?.uid
        //print("current user id: ", userID!)
        
        
        let r = dRef.child("users").child(userID!)
        r.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get all user informaiton
            let value = snapshot.value as? NSDictionary
            //get the email from the database
            let email = value?["email"] as? String ?? ""
            //get a dictionary full of task NSDictionaries
            let tasks = value?["tasks"] as? NSDictionary
            
            //iterate through each task dictionary
            for (key, value) in tasks!{
                //for the current task, find all the information
                let task = tasks?[key] as! NSDictionary
                let dateCode = task["dateCode"] as? Int
                print(dateCode)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        

//        r.observe(.value){ snapshot in
//            for child in snapshot.children{
//
//                let task=child as! DataSnapshot
////
////                self.tasks.append(t)
////                print("added t: ",t)
//                //list.append(t)
//            }
//
//        }
        
        viewController.tasksExisting(dbTasks: tasks)
        
    }
    
  
}
