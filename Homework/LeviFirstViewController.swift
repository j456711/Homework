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

struct NotificationStruct {
    static let first = Notification.Name(rawValue: "first")
    static let second = Notification.Name(rawValue: "second")
}

class LeviFirstViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    var titleLevi: String?
    @objc dynamic var titleKVOLevi: String?
    var closure: (() -> Void)? = nil
    var observer: NSKeyValueObservation!
    
    @IBAction func action() {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LeviSecondViewController") as? LeviSecondViewController else {return}
        guard let title = textField.text else {return}
        
        //1 Property
       // vc.titleLevi = title
        
        //2 delgate
        vc.delgate = self
        
        //3 closure
        vc.testClosure = {[weak self] text in
            
            self?.titleLevi = text
        }
        vc.sendClosure = { [weak self] in
            
            return self?.textField.text ?? ""
        }

        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func unwindSegueLevi(segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3 NotifiationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(getTitle(notifciation:)), name: NotificationStruct.first, object: nil)
        
        
       // self.titleLevi = "AA"
//        print(NSString(format: "%p", address(o: &self.titleLevi)))
//        print(Unmanaged.passUnretained(self).toOpaque())
//        print(Unmanaged.passUnretained(self.button).toOpaque())
//
//        withUnsafeBytes(of: &(self.titleLevi), { (point) -> Void in
//            print(point)
//        })
//        print(NSString(format: "%p", addressHeap(o: self)))
//        print("stop")
        
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
            
            //1 Property
            //vc.titleLevi = title
            
            
            //2 KVO
            self.addObserver(vc, forKeyPath: "titleKVOLevi", options: [.new], context: nil)
            observer = vc.observe(\.titleKVOLevi, options: [ .new], changeHandler: { [weak self](object, change) in
                print(change)
                print(object)
                guard let title = change.newValue as? String else {return}
                self?.titleLevi = title
                
            })
            titleKVOLevi = title
            //vc.addObserver(self, forKeyPath: "titleKVOLevi", options: [.new], context: nil)
            
            
            
            //3 NotifiationCenter
//            NotificationCenter.default.addObserver(vc, selector: #selector(vc.getTitleSecond(notifciation:)), name: NotificationStruct.second, object: nil)
//            NotificationCenter.default.post(name: NotificationStruct.second, object: title)
            
            //4 delgate
            vc.delgate = self
            
            
            
            //5 closure
//            vc.testClosure = {[weak self] text in
//                self?.titleLevi = text }
//            vc.sendClosure = { [weak self] in
//                return self?.textField.text ?? ""
//            }
//            vc.closure(complethilder: { text in
//                self.titleLevi = text
//
//            })
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        self.titleLabel.text = self.titleLevi
    }
    
    
    func address(o: UnsafeRawPointer) -> Int {
        return Int(bitPattern: o)
    }
    
    func addressHeap<T: AnyObject>(o: T) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }

    @objc func getTitle(notifciation: NSNotification) {
//        guard let title = notifciation.userInfo?[AnyHashable("Levi")] as? String else {return}
//        titleLevi = title
        guard let titleTwo = notifciation.object as? String else {return}
        titleLevi = titleTwo
      
    }
}


extension LeviFirstViewController: DelgateSend {
    
    func sendData(title: String) {

        self.titleLevi = title
    }
    
}
