//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Kuang Yao Chang on 2018/4/8.
//  Copyright © 2018年 Kuang Yao Chang. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [toDoClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDo()

    }

    func createToDo() -> [toDoClass] {
        
        let eggs = toDoClass()
        eggs.name = "Buy Eggs"
        eggs.isImportant = true
        
        let dog = toDoClass()
        dog.name = "Walk the Dog"
        
        let cheese = toDoClass()
        cheese.name = "Eat Cheese"
        
        return [eggs,dog,cheese]
        
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
            if toDo.isImportant {
        cell.textLabel?.text = "❗️" + toDo.name
            } else {
        cell.textLabel?.text = toDo.name
            }
        
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? toDoClass {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
            }
        }
    }

}
