//
//  ViewController.swift
//  Schematic
//
//  Copyright © 2019 WP Technology Inc. All rights reserved.
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

