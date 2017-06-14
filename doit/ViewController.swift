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
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "0"
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task0 = Task()
        task0.name = ""
        task0.important = true
        return [task0]
    }
    
    
}

