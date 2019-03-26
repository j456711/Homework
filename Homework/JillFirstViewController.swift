//
//  JillFirstViewController.swift
//  Homework
//
//  Created by 渡邊君 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import Foundation
import UIKit

// --------------- Push: Property START ---------------

//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func nextPageButtonPressed(_ sender: UIButton) {
//
//        performSegue(withIdentifier: "SegueNextPage", sender: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "SegueNextPage" {
//
//            if let destination = segue.destination as? JillSecondViewController {
//
//                destination.firstPageText = textField.text
//            }
//        }
//    }
//
//
//}

// --------------- Push: Property END ---------------


// --------------- Push: Delegate START ---------------

//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func nextPageButtonPressed(_ sender: Any) {
//
//        performSegue(withIdentifier: "SegueNextPage", sender: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "SegueNextPage" {
//
//            if let destination = segue.destination as? JillSecondViewController {
//
//                destination.firstPageText = textField.text
//
//                destination.delegate = self
//            }
//        }
//    }
//}
//
//extension JillFirstViewController: TextDelegate {
//
//    func passData(_ viewController: JillSecondViewController) {
//
//        self.label.text = viewController.textfield.text
//    }
//}

// --------------- Push: Delegate END ---------------


// --------------- Push: Closure START ---------------

//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func nextPageButtonPressed(_ sender: UIButton) {
//
//        performSegue(withIdentifier: "SegueNextPage", sender: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "SegueNextPage" {
//
//            if let destination = segue.destination as? JillSecondViewController {
//
//                destination.firstPageText = textField.text
//
//                destination.dataHandler = {
//
//                    self.label.text = destination.textField.text
//                }
//            }
//        }
//    }
//
//}

// --------------- Push: Closure END ---------------


// --------------- Push: NotificationCenter START ---------------

extension Notification.Name {
    static let nextPageText = Notification.Name("nextPageText")
    static let lastPageText = Notification.Name("lastPageText")
}

class JillFirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var label: UILabel!

    @IBAction func nextPageButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "SegueNextPage", sender: nil)
        
        NotificationCenter.default.post(name: .nextPageText, object: nil, userInfo: ["nextPageText" : textField.text!])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateLabelText(_:)), name: .lastPageText, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueNextPage" {
            
            if let destination = segue.destination as? JillSecondViewController {
                
                NotificationCenter.default.addObserver(destination, selector: #selector(destination.updateLabelText(_:)), name: .nextPageText, object: nil)
            }
        }
    }

    @objc func updateLabelText(_ notification: Notification) {

        if let dict = notification.userInfo {

            label.text = dict["lastPageText"] as? String
        }
    }

}

// --------------- Push: NotificationCenter END ---------------


// --------------- Push: KVO START ---------------

//class DisplayedText: NSObject {
//
//    @objc dynamic var firstPageText = String()
//    @objc dynamic var secondPageText = String()
//}
//
//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func nextPageButtonPressed(_ sender: UIButton) {
//
//        displayedText.firstPageText = textField.text!
//
//        performSegue(withIdentifier: "SegueNextPage", sender: nil)
//    }
//
//    @objc let displayedText = DisplayedText()
//
//    var secondPageObserver: NSKeyValueObservation?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        secondPageObserver = displayedText.observe(\.secondPageText, options: [.new], changeHandler: { (strongSelf, change) in
//
//            guard let updatedText = change.newValue else { return }
//
//            self.label.text = updatedText
//
//        })
//    }
//
//}
