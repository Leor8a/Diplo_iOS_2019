//
//  ViewController.swift
//  TableExample
//
//  Created by Luis Ernesto Ochoa Ríos on 25/08/18.
//  Copyright © 2018 Luis Ernesto Ochoa Ríos. All rights reserved.
//
//  Please View the README.md File for more info of the modifcications of this project.
//
//  I'm wondering if a noob guy is like a nib file.
//  =) Happy coding !!
//  From MX City with Love!



import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var boolArray = [Bool]()
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOfNames = ["Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max", "Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max","Louis", "Peter", "Jhon", "Max",]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNames.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = arrayOfNames[indexPath.row]
        
        //MARK: Recycling Problem
        boolArray.append(false)
        if(boolArray[indexPath.row]){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath)
        //cell?.accessoryType = .checkmark
        
        //MARK: Handle the change of the checkmark and change of boolArray.
        
        if cell?.accessoryType == UITableViewCellAccessoryType.checkmark {
            cell?.accessoryType = UITableViewCellAccessoryType.none
            boolArray[indexPath.row] = false
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            boolArray[indexPath.row] = true
        }
        
        print(boolArray)
        
        //Only remember that this is an alert for when you are Selecting/Deselecting the tableview cell.(Showed in class)
        
/*
        let alertController = UIAlertController(title: "Alumnos", message:"Hola como estas", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        //Quien tiene el control..
        //alertController.popoverPresentationController
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
*/
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}

