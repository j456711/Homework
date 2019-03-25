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
    @IBAction func action() {
        titleKVOLevi = textField.text
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = titleLevi
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.dismiss.rawValue {
            
            guard let vc = segue.destination as? LeviFirstViewController else {return}
            guard let title = textField.text else {return}
            
            /////1
          //  vc.titleLabel.text = title
            
            ////2
//            self.addObserver(vc, forKeyPath: "titleKVOLevi", options: [.new], context: nil)
//            self.titleKVOLevi = title
//            vc.removeObserver(self, forKeyPath: "titleKVOLevi")
            
            ///3
            NotificationCenter.default.post(name: NotificationStruct.first, object: title)
            
            //4
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
}

//extension NotificationCenter {
//
//    static var titleLevi: String?
//}

