//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Kuang Yao Chang on 2018/4/15.
//  Copyright © 2018年 Kuang Yao Chang. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo = toDoClass()
    

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo.name
        
    }

    @IBAction func completeTapped(_ sender: Any) {
        var index = 0
        for toDo in previousVC.toDos {
            
            if toDo.name == selectedToDo.name{
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                //print("We found It! \(toDo.name) \(index)")
                break
                
            }
           index += 1
        }
    
    }
    
    
}
