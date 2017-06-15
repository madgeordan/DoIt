//
//  AddViewController.swift
//  doit
//
//  Created by George Lushch on 6/15/17.
//  Copyright © 2017 madgeordan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskImportant: UISwitch!
    
    var VC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func taskAdd(_ sender: Any) {
        let task = Task()
        task.name = taskName.text!
        task.important = taskImportant.isOn
        VC.tasks.append(task)
        VC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
