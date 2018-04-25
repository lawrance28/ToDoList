//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Kuang Yao Chang on 2018/4/8.
//  Copyright © 2018年 Kuang Yao Chang. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        let toDo = toDoClass()
        if let titleTextFieldUnwrapped = titleTextField.text {
         toDo.name = titleTextFieldUnwrapped
         toDo.isImportant = importantSwitch.isOn
         previousVC.toDos.append(toDo)
         previousVC.tableView.reloadData()
         navigationController?.popViewController(animated: true)
        }
      
    }
    

}
