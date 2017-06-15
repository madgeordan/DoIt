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
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = "     \(task.name)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tasks[indexPath.row]
        performSegue(withIdentifier: "completeSegue", sender: cell)
    }
    
    func makeTasks() -> [Task] {
        let task0 = Task()
        task0.name = "1"
        task0.important = true
        let task1 = Task()
        task1.name = "1"
        task1.important = false
        return [task0, task1]
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let VC = segue.destination as! AddViewController
            VC.VC = self
        } else {
            let VC = segue.destination as! CompleteViewController
            VC.task = sender as! Task
            VC.VC = self
        }
    }
}

