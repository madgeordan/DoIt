//
//  ViewController.swift
//  doit
//
//  Created by George Lushch on 6/14/17.
//  Copyright © 2017 madgeordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = "     \(task.name!)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tasks[indexPath.row]
        performSegue(withIdentifier: "completeSegue", sender: cell)
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("FETCH FUCKED UP!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completeSegue" { let VC = segue.destination as! CompleteViewController
            VC.task = sender as? Task
        }
    }
}


