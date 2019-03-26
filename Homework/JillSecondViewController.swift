//
//  JillSecondViewController.swift
//  Homework
//
//  Created by 渡邊君 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import Foundation
import UIKit

// --------------- Push: Property START ---------------

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func lastPageButtonPressed(_ sender: UIButton) {
//
//        guard let firstVC = self.navigationController?.viewControllers.first as? JillFirstViewController else { return }
//
//        firstVC.label.text = self.textField.text
//
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    var firstPageText: String?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        label.text = firstPageText
//    }
//
//}

// --------------- Push: Property END ---------------


// --------------- Push: Delegate START ---------------

//protocol TextDelegate: AnyObject {
//
//    func passData(_ viewController: JillSecondViewController)
//}
//
//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textfield: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func lastPageButtonPressed(_ sender: UIButton) {
//
//        self.delegate?.passData(self)
//
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    var firstPageText: String?
//
//    weak var delegate: TextDelegate?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        label.text = firstPageText
//    }
//}

// --------------- Push: Delegate END ---------------


// --------------- Push: Closure START ---------------

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func lastPageButtonPressed(_ sender: UIButton) {
//
//        dataHandler?()
//
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    var firstPageText: String?
//
//    var dataHandler: (() -> Void)?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        label.text = firstPageText
//    }
//
//}

// --------------- Push: Closure END ---------------


// --------------- Push: NotificationCenter START ---------------

class JillSecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var label: UILabel!

    @IBAction func lastPageButtonPressed(_ sender: UIButton) {

        NotificationCenter.default.post(name: .lastPageText, object: nil, userInfo: ["lastPageText" : textField.text!])

        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        label.text = firstPageText
    }
    
    var firstPageText: String?
    
    @objc func updateLabelText(_ notification: Notification) {
        
        if let dict = notification.userInfo {
            
            firstPageText = dict["nextPageText"] as? String
        }
    }

}

// --------------- Push: NotificationCenter END ---------------


// --------------- Push: KVO START ---------------

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func lastPageButtonPressed(_ sender: UIButton) {
//        
//        displayedText.firstPageText = textField.text!
//        
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    @objc let displayedText = DisplayedText()
//
//    var firstPageObserver: NSKeyValueObservation?
//
//    var firstPageText: String?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        firstPageObserver = displayedText.observe(\.firstPageText, options: [.new], changeHandler: { (strongSelf, change) in
//
//            guard let updatedText = change.newValue else { return }
//            
//            self.label.text = updatedText
//            
//        })
//    }
//}
