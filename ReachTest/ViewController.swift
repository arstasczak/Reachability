//
//  ViewController.swift
//  ReachTest
//
//  Created by Student on 03.01.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let reachability = Reachability()!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                self.label.text = "WiFi"
            } else {
                self.label.text = "Cellular"
            }
        }
        reachability.whenUnreachable = { _ in
            self.label.text = "Offline"
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

