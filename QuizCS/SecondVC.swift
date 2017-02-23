//
//  SecondVC.swift
//  quizApp
//
//  Created by Alan Kantserov on 14.02.17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    // @IBOutlet weak var FScore: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    
    var passedString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        finalScore.text = passedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
