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
    
    @IBAction func btnMapClicked(_ sender: UIButton) {
            self.performSegue(withIdentifier: "moveToMapSegue", sender: self)
    }
    
    @IBAction func btnTable(_ sender: Any) {
              self.performSegue(withIdentifier: "moveToTable", sender: self)
    }
    
    @IBAction func btnWebClick(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToWebSegue", sender: self)
    }
    @IBAction func btnMoveImageClicked(_ sender: Any) {
        let alert=UIAlertController (title: "資訊", message:"YN", preferredStyle: .alert)
        let okAction=UIAlertAction(title: "YES", style:.default , handler: {action in
         
            
            DispatchQueue.main.async {
                  self.performSegue(withIdentifier: "moveToM2kimage", sender: self)
            }
        })
        alert.addAction(okAction)
        let cancelAction=UIAlertAction(title: "No", style:.default , handler: {action in
            
        })
        alert.addAction(cancelAction)
        present(alert,animated:true,completion: nil )
        
      //  performSegue(withIdentifier: "moveToM2kimage", sender: self)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="moveToM2kimage")
        {
            let vc = segue.destination as! ImageViewController
            vc.index=5
        }
    }

    
}

