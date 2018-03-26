//
//  SecondViewController.swift
//   To-Do List
//
//  Created by Mark Victor Di Meglio on 6/24/16.
//  Copyright © 2016 Mark Victor Di Meglio. All rights reserved.
//

import UIKit

var toDoList = [String]()
var notes = [String]() 

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var toDoListTable: UITableView!
    @IBOutlet var editBarButton: UIBarButtonItem!
    @IBOutlet var addBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String]
            
        }
        
        if UserDefaults.standard.object(forKey: "notes") != nil {
            notes = UserDefaults.standard.object(forKey: "notes") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return toDoList.count
    
    }
    
    func tabeView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let itemToMove = toDoList[sourceIndexPath.row]
        let otherItem = notes[sourceIndexPath.row]
        toDoList.remove(at: sourceIndexPath.row)
        notes.remove(at: sourceIndexPath.row)
        toDoList.insert(itemToMove, at: destinationIndexPath.row)
        notes.insert(otherItem, at: destinationIndexPath.row)
        
    }
    
    
    @IBAction func editButtonDidPressed(_ sender: Any) {
        
        if toDoListTable.isEditing {
            toDoListTable.setEditing(false, animated: true)
            editBarButton.title = "Edit"
            addBarButton.isEnabled = true
        } else {
            toDoListTable.setEditing(true, animated: true)
            editBarButton.title = "Done"
            addBarButton.isEnabled = false
        }
        
        
    }
    
    
    @IBAction func addItemDidPressed(_ sender: Any) {
        performSegue(withIdentifier: "listToAdd", sender: self)
    }
    

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! listTableViewCell
        
        
      cell.title.text = toDoList[indexPath.row]
        cell.note.text = notes[indexPath.row]
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            toDoList.remove(at: indexPath.row)
            
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
        }
        
    }
   
        
    override func viewDidAppear(_ animated: Bool) {

            toDoListTable.reloadData()
        }
    
}
    

