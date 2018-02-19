//
//  FirstViewController.swift
//   To-Do List
//
//  Created by Mark Victor Di Meglio on 6/24/16.
//  Copyright © 2016 Mark Victor Di Meglio. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var toDoTxtField: UITextField!
    @IBOutlet var noteTextField: UITextField!
    
    @IBAction func toDoListBtn(_ sender: AnyObject) {
        
        if toDoTxtField.text == "" || noteTextField.text == "" {
            createAlert(title: "You done messed up!", message: "Fill out both fields before adding something to the list")
            
        } else {
        
            toDoList.append(toDoTxtField.text!)
            notes.append(noteTextField.text!)
            
            toDoTxtField.text = ""
            toDoTxtField.placeholder = "Add Another Item"
            noteTextField.text = ""
            noteTextField.placeholder = "Add Another Note"
        
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            UserDefaults.standard.set(notes, forKey: "notes")
            
            self.performSegue(withIdentifier: "addToList", sender: self)
            
            }
        
        
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.toDoTxtField.delegate = self
        self.noteTextField.delegate = self
        
        toDoTxtField.text = ""
        noteTextField.text = ""
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        toDoTxtField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        toDoTxtField.placeholder = "Add Item"
        noteTextField.placeholder = "Add A Note"
        
    }
    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }

}

