//
//  AddTaskViewController.swift
//  Due It
//
//  Created by Ben Rock on 11/24/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

var userTasks = [Task]()

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var urgencyInput: UISlider!
    
    @IBAction func changeUrgency(_ sender: Any) {
        let newTask = Task(name: input.text!, urgency: Int(urgencyInput.value), date: dateInput.date)
        view.backgroundColor = newTask.getTaskColor()
    }
    
    @IBAction func changeDate(_ sender: Any) {
        let newTask = Task(name: input.text!, urgency: Int(urgencyInput.value), date: dateInput.date)
        view.backgroundColor = newTask.getTaskColor()
    }
    
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
        /*
        sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 666, height: 500))
        sceneView.backgroundColor = UIColor.black
        self.view.addSubview(sceneView)
        
        if let view = self.sceneView as SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "particles") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
        }
 */
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
