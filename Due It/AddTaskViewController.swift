//
//  AddTaskViewController.swift
//  Due It
//
//  Created by Ben Rock on 11/24/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit

var userTasks = [Task]()

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var urgencyInput: UISlider!
    
    @IBAction func add_item(_ sender: Any) {
        
        if (input.text != "") {
            let newTask = Task(name: input.text!, urgency: Int(urgencyInput.value), date: dateInput.date)
            userTasks.append(newTask)
            list.append(input.text!)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
