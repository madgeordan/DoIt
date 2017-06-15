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
    var task: Task? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskName.text = task!.name
        
    }
    
    @IBAction func taskCompleted(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
