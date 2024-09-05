//
//  ViewController.swift
//  Interview
//
//  Created by Otis on 2024/9/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customQueue()
    }

    private func mainQueue() { // Serial
        print("task1")
        DispatchQueue.main.async {
            print("task2")
        }
        print("task3")
    }
    
    private func globalQueue() { // Concurrent
        print("task1")
        DispatchQueue.global().sync {
            print("task2")
        }
        print("task3")
    }
    
    private func customQueue() { // Default Serial
        let customQueue = DispatchQueue(label: "com.otis.testGCD")
        print("task1")
        DispatchQueue.global().async {
            print("task2")
            customQueue.sync {
                print("task3")
            }
            print("task4")
        }
        print("task5")
    }
    
    
}

