//
//  CompleteViewController.swift
//  doit
//
//  Created by George Lushch on 6/15/17.
//  Copyright © 2017 madgeordan. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    
    @IBOutlet weak var taskName: UILabel!
    
    var VC = ViewController()
    var task = Task()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskName.text = task.name
        
    }
    
    @IBAction func taskCompleted(_ sender: Any) {
        VC.tasks.remove(at: VC.selectedIndex)
        VC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

}
