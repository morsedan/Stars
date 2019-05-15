//
//  ViewController.swift
//  Stars
//
//  Created by morse on 5/14/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let customControl = CustomControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "User Rating: \(customControl.value) stars"
    }

    @IBAction func updateRating(_ sender: CustomControl) {
        navigationItem.title = "User Rating: \(customControl.value) stars"
    }
    
}

