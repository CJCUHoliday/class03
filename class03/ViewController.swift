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
        //print("\(UserDefaults.standard.string(forKey: "hi")!)")
        let worker:FileWorker=FileWorker()
        worker.writeToFile(content: "中文", fileName: "info.txt", tag:0)
        let  result:String = worker.readFromFile(fileName: "info.txt", tag: 0)
        print(result)
        // Do any additional setup after loading the view, typically from a nib.
    }


    
}

