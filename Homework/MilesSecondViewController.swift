//
//  MilesSecondViewController.swift
//  Homework
//
//  Created by Hsien Han on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import UIKit

protocol SendSecondMessage {
    
    func secondMessage(text: String)
    
}

class MilesSecondViewController: UIViewController {
    
    func fethText(text: String) {
        secondLabel.text = text
    }
    
    
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    
    var delegate: SendSecondMessage?
    
    var secondMessage: String? // Property 傳值
    
    var firstMessage: String? // Notification 傳值
    
    var secondKVO = KVOModel()
    
    var sob: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondButton.layer.cornerRadius = 5
    }
    
    // Notification 傳值(接 firstVC 傳來的值)
//    @objc func firstWords(noti:Notification) {
//        let firstlabel = noti.userInfo
//        firstMessage = firstlabel?["firstMessage"] as? String
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Notification 傳值
//        secondLabel.text = firstMessage
        
        
        // Property 傳值
//        secondLabel.text = secondMessage
        
        
        // KVO 傳值(監聽 firstVC)
//        sob = secondKVO.observe(\.secondMessages, options: [.new, .initial]) { (object, change) in
//            self.secondLabel.text = change.newValue
//        }
    }

    
    @IBAction func backFirstVC(_ sender: UIButton) {
        
        // KVO 傳值, Closure 傳值
//        guard let firstVC = self.navigationController?.viewControllers.first as? MilesFirstViewController else { return }
        
        // Present
//        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "MilesFirstVC") as! MilesFirstViewController
        
        
        // Closure 傳值
//        firstVC.secondVC = self
//        firstVC.firstLabel.text = self.secondTextField.text
        
        
        // delegate 傳值
//        delegate?.secondMessage(text: secondTextField.text!)
        
        
        // Notification 傳值
//        let notificationName = Notification.Name("secondWords")
//        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["secondMessage": secondTextField.text!])
        
        
        // KVO 傳值(secondVC.textfiled 的值帶給 firstVC)
//        firstVC.firstKVO.firstMessages = secondTextField.text ?? ""
        
        
//        self.present(firstVC, animated: true, completion: nil) // closure
//        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil) // delegate(first present)
        
    }
    
//    func sendWord(message: String) {
//        secondLabel.text = message
//    }
    
    // closure 傳值
//    func prepareText(_ handler: (String) -> Void) {
//
//        guard let text = secondTextField.text else { return }
//
//        handler(text)
//
//    }
//
}

