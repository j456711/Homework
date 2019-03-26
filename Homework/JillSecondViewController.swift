//
//  JillSecondViewController.swift
//  Homework
//
//  Created by 渡邊君 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import UIKit

// --------------- Push: Property START ---------------

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
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
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
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
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        dataHandler?(textField.text!)
//
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    var firstPageText: String?
//
//    var dataHandler: ((_ text: String) -> Void)?
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

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        NotificationCenter.default.post(name: .lastPageText, object: nil, userInfo: ["lastPageText" : textField.text!])
//
//        self.navigationController?.popViewController(animated: true)
//    }
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
//    var firstPageText: String?
//
//    @objc func updateLabelText(_ notification: Notification) {
//
//        if let dict = notification.userInfo {
//
//            firstPageText = dict["nextPageText"] as? String
//        }
//    }
//
//}

// --------------- Push: NotificationCenter END ---------------


// --------------- Push: KVO START ---------------

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        if let firstVC = self.navigationController?.viewControllers.first as? JillFirstViewController {
//
//            firstVC.displayedText.secondPageText = textField.text!
//        }
//
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    @objc let displayedText = DisplayedText()
//
//    var secondPageObserver: NSKeyValueObservation?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        secondPageObserver = observe(\.displayedText.firstPageText, options: [.new], changeHandler: { (object, change) in
//
//            guard let updatedValue = change.newValue else { return }
//
//            self.label.text = updatedValue
//        })
//    }
//}

// --------------- Push: KVO END ---------------


// --------------- Present: Property START ---------------

//class JillSecondViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        guard let firstVC = self.presentingViewController as? JillFirstViewController else { return }
//
//        firstVC.label.text = textField.text!
//
//
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    var firstPageText: String?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        label.text = firstPageText
//    }
//}

// --------------- Present: Property END ---------------


// --------------- Present: Delegate START ---------------

protocol SecondVCDelegate: AnyObject {
    
    func passDataToFirstVC(text: String)
}

class JillSecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        self.delegate?.passDataToFirstVC(text: textField.text!)
        
        self.dismiss(animated: true, completion: nil)
    }

    weak var delegate: SecondVCDelegate?
    
    var firstPageText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = firstPageText
    }
    
}

// --------------- Present: Delegate END ---------------



// --------------- Retain Cycle START ---------------

//class JillSecondViewController: UIViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    deinit {
//
//        print("JillSecond is killed.")
//    }
//}
