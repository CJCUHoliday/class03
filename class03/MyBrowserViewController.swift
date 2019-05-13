//
//  MyBrowserViewController.swift
//  class03
//
//  Created by L20102-02 on 2019/5/6.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit

class MyBrowserViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillAppear(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillDisappear(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Mark:--
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let accept="abcdeABCDE"
        let cs=NSCharacterSet(charactersIn: accept).inverted
        let filterms=string.components(separatedBy: cs).joined(separator: "")
        if(string != filterms)
        {
            return false
        }
        return true
    }
    //--
    @objc func keyboardwillAppear(notification:NSNotification?){
        print("keyboardwillAppear")
        guard let frame=notification? .userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        UIView.animate(withDuration: 5000, animations: {
               self.btnGoBottomConstraint.constant=frame.cgRectValue.height;
            
        })
    
       // self.btnGoBottomConstraint.constant=400;
        
        //self.btnGo.Con.constant=400;
    }
    @objc func keyboardwillDisappear(notification:NSNotification?){
        print("keyboardwillDisappear")
        UIView.animate(withDuration: 5000, animations: {
            self.btnGoBottomConstraint.constant=31;
            
        })
        
        
    }
    
    /*
    @objc func keyboardwillAppear()
    {
        
    }
 */
}
