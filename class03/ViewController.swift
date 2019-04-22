//
//  ViewController.swift
//  class03
//
//  Created by L20102-02 on 2019/4/15.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label_A: UILabel!
    
    @IBAction func Button_Push(_ sender: Any) {
        Label_A.text="HI,Xcode"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
}

