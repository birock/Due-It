//
//  ViewController.swift
//  Due It
//
//  Created by Dan McKenna on 11/12/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks = ["Write essay", "Do laundry", "Read chapter 3", "Call mom"];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasks.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Task")
        return(task)
    }
    
    func tableView(_ tableview: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.tasks.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

