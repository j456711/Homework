//
//  LeviSecondViewController.swift
//  Homework
//
//  Created by 姜旦旦 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import Foundation
import UIKit

class LeviSecondViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    var titleLevi: String?
    @objc dynamic var titleKVOLevi: String?
    weak var delgate: DelgateSend?
    var testClosure: ((String) -> Void)?
    var sendClosure: (()-> String)?
    
    @IBAction func action() {
//        titleKVOLevi = textField.text
//
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = titleLevi
        if sendClosure != nil {
            
            self.titleLabel.text = sendClosure!()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.dismiss.rawValue {
            
            titleKVOLevi = textField.text
            
            guard let vc = segue.destination as? LeviFirstViewController else {return}
            guard let title = textField.text else {return}
            
            /////1
          //  vc.titleLabel.text = title
            
            ////2 KVO
//            self.addObserver(vc, forKeyPath: "titleKVOLevi", options: [.new], context: nil)
//            self.titleKVOLevi = title
//            vc.removeObserver(self, forKeyPath: "titleKVOLevi")
            
            ///3 NotifiationCenter
            //NotificationCenter.default.post(name: NotificationStruct.first, object: title)
            
            //4 Delgate
           // self.delgate?.sendData(title: title)
            
            //5 Closure
            testClosure?(title)
            
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "titleKVOLevi" {
          
            guard let title = change?[NSKeyValueChangeKey.newKey] as? String else {return}
            self.titleLevi = title
        }
    }
    
    
    @objc func getTitleSecond(notifciation: NSNotification) {
        
        guard let titleTwo = notifciation.object as? String else {return}
        titleLevi = titleTwo
    
    }
    
    func closure(complethilder: @escaping (String) ->  Void) {
        
        self.testClosure = complethilder
    }
}

protocol DelgateSend: class {
    func sendData(title: String)
}
