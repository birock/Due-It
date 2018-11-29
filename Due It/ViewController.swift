//
//  ViewController.swift
//  Due It
//
//  Created by Dan McKenna on 11/12/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit

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
    
    func tableView(_ tableview: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.tasks.remove(at: indexPath.row)
            numFinished += 1
            print("Tasks Completed: ", numFinished)
            list = tasks
            myTableView.reloadData()
        }
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

