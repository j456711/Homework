//
//  ViewController.swift
//  Homework
//
//  Created by Hsien Han on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import UIKit



@objcMembers class KVOModel: NSObject {
    dynamic var firstMessages = String()
    dynamic var secondMessages = String()
}


class MilesFirstViewController: UIViewController, SendSecondMessage {

    @IBOutlet weak var firstTextFiled: UITextField!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    
    
    var secondVC: MilesSecondViewController?
    
    var firstKVO = KVOModel()
    
    var fob: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.layer.cornerRadius = 5
        
        // Notification 傳值(註冊 firstVC)
//        NotificationCenter.default.addObserver(self, selector: #selector(secondWords(noti:)), name: NSNotification.Name("secondWords"), object: nil)

        
        // KVO 傳值
//        fob = firstKVO.observe(\.firstMessages, options: [.new]) { (object, change) in
//
//            self.firstLabel.text = change.newValue
//        }
        
    }
    
    // Notification 傳值(接 secondVC 傳來的值)
//    @objc func secondWords(noti:Notification) {
//        let label = noti.userInfo
//        self.firstLabel.text = label?["secondMessage"] as? String
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // closure 傳值
//        secondVC?.prepareText { (text) in
//            firstLabel.text = text
//        }
//
//    }
//
//    deinit {
//
//        print("FirstVC is died.")
        
        
        // KVO 傳值(監聽 secondVC)
//        fob = firstKVO.observe(\.firstMessages, options: [.new]) { (object, change) in
//            self.firstLabel.text = change.newValue
//        }

    }
    
    @IBAction func toSecondVC(_ sender: UIButton) {
        
        // KVO 傳值
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "MilesSecondVC") as? MilesSecondViewController else { return }
        
        // Delegate
//        secondVC.delegate = self
        
        
        // Propeprty 傳值
//        secondVC.secondMessage = self.firstTextFiled.text
        
        
        // Notification 傳值(註冊 secondVC)
//        NotificationCenter.default.addObserver(secondVC, selector: #selector(secondVC.firstWords(noti:)), name: NSNotification.Name("firstWords"), object: nil)
        
        // Notification 傳值(firstVC 帶值至 secondVC)
//        let notificationName = Notification.Name("firstWords")
//        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["firstMessage": firstTextFiled.text!])
        
        
        // KVO 傳值(firstVC.textfiled 的值帶給 secondVC.Label)
//        secondVC.secondKVO.secondMessages = firstTextFiled.text ?? ""
        
//        self.present(secondVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)

    }
    
    func secondMessage(text: String) {
        firstLabel.text = text
    }
    
}

