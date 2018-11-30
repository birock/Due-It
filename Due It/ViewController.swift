//
//  ViewController.swift
//  Due It
//
//  Created by Dan McKenna on 11/12/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit
//adding firebase for database storage
import FirebaseDatabase

var list = [String]()
var numFinished = 0


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks = list;
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasks.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Task")
        task.backgroundColor = userTasks[indexPath.row].getTaskColor()
        task.textLabel?.text = tasks[indexPath.row]

        return(task)
    }
    
    /* commenting out bens function to try creating edit
     
    func tableView(_ tableview: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.tasks.remove(at: indexPath.row)
            numFinished += 1
            print("Tasks Completed: ", numFinished)
            list = tasks
            myTableView.reloadData()
        }
   
    }
 */
    
    //Raab testing a delete and edit function
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //let task=tasks[indexPath.row]
        //edit
        let editTask=UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            //call edit task function
            print(".........edit..........")
            self.editT(indexPath: indexPath)
        }
        //delete
        let deleteTask=UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            //call delete task function
            print("..........delete..................")
            self.deleteT(indexPath: indexPath)
        }
        
        editTask.backgroundColor = .blue
        deleteTask.backgroundColor = .red
        return [editTask, deleteTask]
    }
    
    //function to edit task
    private func editT(indexPath: IndexPath){
        print(".......made it here.........")
        //go to edit view
        let storyboard:UIStoryboard=UIStoryboard(name:"Main", bundle:nil)
        let EditVC:EditTaskViewController=storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
        self.present(EditVC, animated: true, completion: nil)
        
        //send tasks info to the edit screen
        EditVC.view.backgroundColor = userTasks[indexPath.row].getTaskColor()
        EditVC.editTaskTitle.text=userTasks[indexPath.row].getTaskName()
        
        EditVC.setDate(Date: userTasks[indexPath.row].getDueDate())
        
        EditVC.getRow(indexPath: indexPath)
        
        EditVC.editUrgency.value=Float(userTasks[indexPath.row].urgencyCode)
        
    }
    //function to delete task
    private func deleteT(indexPath: IndexPath){
      
        self.tasks.remove(at: indexPath.row)
        numFinished += 1
        print("Tasks Completed: ", numFinished)
        //self.tableView?.deleteRows(at: [indexPath], with: .automatic)
        list = tasks
        myTableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
  


    }
}

