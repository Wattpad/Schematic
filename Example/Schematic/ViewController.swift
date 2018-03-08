//
//  ViewController.swift
//  Schematic
//
//  Created by alexjfigueroa@gmail.com on 03/08/2018.
//  Copyright (c) 2018 alexjfigueroa@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: View Setup
    override func loadView() {
        view = ExampleView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Breakdown"
    }
}

