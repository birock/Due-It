//
//  Task.swift
//  Due It
//
//  Created by Dan McKenna on 11/18/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit

class Task: NSObject {
    var taskName: String; //name of the task itself
    var urgencyCode: Int; //how important the task is
    var dateCode: Int; //how close is the task to the due date?
    var taskCode: Int;
    var dueDate: Date; //when the task needs to be completed by
    var taskColor: UIColor; //the color that the task has to be according to date and urgency
    
    /* initialize the task with a name, urgency, and due date from the user.
     * Then init the date code and color generically for now.
     */
    init(name: String, urgency: Int, date: Date) {
        self.taskName = name;
        self.urgencyCode = urgency;
        self.dueDate = date;
        self.dateCode = 0;
        self.taskCode = 0;
        self.taskColor = UIColor.green;
    }
    
    func getTaskCode() -> Int{
        //the code to determine the color is based on the urgency + date
        taskCode = (self.urgencyCode + self.dateCode);
        return taskCode;
    }
    
    func getDateCode() -> Int{
        //retrieve the amount of days between now and the due date, so everytime this
        // method is called it returns the updated code and updates the field in the object itself.
        let daysBetween = Calendar.current.component(.day, from: self.dueDate);
        
        if(daysBetween >= 14){
            self.dateCode = 1;
        }
        else if(daysBetween >= 7){
            self.dateCode = 2;
        }
        else if(daysBetween >= 5){
            self.dateCode = 3;
        }
        else if(daysBetween >= 3){
            self.dateCode = 4;
        }
        else{
            self.dateCode = 5;
        }
        
        return self.dateCode;
    }
    
    func getTaskColor() -> UIColor{
        
        /*
        * Ben, for this I'm thinking of coming up with an array of 10 preset colors based on task code.
        * That way, you can save the RBG or Hex values, and quickly return them in this method. Let me know
        * what you think!
        * -- Dan
        */
        
        var colors: Array<UIColor> = Array();
        
        for i in 1...5 {
            UIColor color = init(red: (10*(i/5)), green: 1.0, blue: 0, alpha: 1.0);
            colors.append(color);
        }
        
        for i in 6...10 {
            UIColor color = init(red: 1.0, green: (10 - 10*(i/5)), blue: 0, alpha: 1.0);
            colors.append(color);
        }
        
        return colors[self.taskCode];
        
    }
    
    func getTaskName() -> String{
        return self.taskName;
    }
    
    func getDueDate() -> Date{
        return self.dueDate;
    }
    
    
    
    
}
