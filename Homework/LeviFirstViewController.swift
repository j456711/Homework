//
//  LeviFirstViewController.swift
//  Homework
//
//  Created by 姜旦旦 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import Foundation
import UIKit

enum Segue: String {
    case push
    case dismiss
}



class LeviFirstViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    var titleLevi: String?
    @objc dynamic var titleKVOLevi: String?
    var closure: (() -> Void)? = nil
    
    
    @IBAction func action() {
        
   
        
    }
    
    @IBAction func unwindSegueLevi(segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        titleKVO.addObserver(self, forKeyPath: "title", options: [.new], context: nil)

        
//        NotificationCenter.default.addObserver(self, selector: #selector(getTitle(notifciation:)), name: NSNotification.Name(rawValue: Segue.push.rawValue), object: nil)
        
//        observe(\LeviFirstViewController.titleKVO.title, options: [.new]) { vc, change in
//
//            guard let title = change.newValue else {return}
//            vc.titleLabel.text = title
//
//        }
        
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "titleKVOLevi" {
            
            guard let title = change?[NSKeyValueChangeKey.newKey] as? String else {return}
            self.titleLevi = title
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.push.rawValue {
            
            guard let vc = segue.destination as? LeviSecondViewController else {return}
            guard let title = textField.text else {return}
            
            /////1
            //vc.titleLevi = title
            
            
            //2
            self.addObserver(vc, forKeyPath: "titleKVOLevi", options: [.new], context: nil)
            titleKVOLevi = title

            
            //3
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.titleLabel.text = self.titleLevi
    }
    
    
    @objc func getTitle(notifciation: NSNotification) {
        
        
    }
}


