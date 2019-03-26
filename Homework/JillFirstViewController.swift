//
//  JillFirstViewController.swift
//  Homework
//
//  Created by 渡邊君 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import UIKit

// --------------- Push: Property START ---------------

//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
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
//}

// --------------- Push: Property END ---------------


// --------------- Push: Delegate START ---------------

//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: Any) {
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
//        self.label.text = viewController.textField.text
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
//    @IBAction func buttonPressed(_ sender: UIButton) {
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
//                destination.dataHandler = { text in
//
//                    self.label.text = text
//                }
//            }
//        }
//    }
//
//}

// --------------- Push: Closure END ---------------


// --------------- Push: NotificationCenter START ---------------

//extension Notification.Name {
//    static let nextPageText = Notification.Name("nextPageText")
//    static let lastPageText = Notification.Name("lastPageText")
//}
//
//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        performSegue(withIdentifier: "SegueNextPage", sender: nil)
//
//        NotificationCenter.default.post(name: .nextPageText, object: nil, userInfo: ["nextPageText" : textField.text!])
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        NotificationCenter.default.addObserver(self, selector: #selector(updateLabelText(_:)), name: .lastPageText, object: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "SegueNextPage" {
//
//            if let destination = segue.destination as? JillSecondViewController {
//
//                NotificationCenter.default.addObserver(destination, selector: #selector(destination.updateLabelText(_:)), name: .nextPageText, object: nil)
//            }
//        }
//    }
//
//    @objc func updateLabelText(_ notification: Notification) {
//
//        if let dict = notification.userInfo {
//
//            label.text = dict["lastPageText"] as? String
//        }
//    }
//
//}

// --------------- Push: NotificationCenter END ---------------


// --------------- Push: KVO START ---------------

//class DisplayedText: NSObject {
//
//    @objc dynamic var firstPageText = ""
//
//    @objc dynamic var secondPageText = ""
//}
//
//class JillFirstViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//
//    @IBOutlet weak var label: UILabel!
//
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        performSegue(withIdentifier: "SegueNextPage", sender: nil)
//    }
//
//    @objc let displayedText = DisplayedText()
//
//    var firstPageObserver: NSKeyValueObservation?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        firstPageObserver = observe(\.displayedText.secondPageText, options: [.new], changeHandler: {(object, change) in
//
//            guard let updatedValue = change.newValue else { return }
//
//            self.label.text = updatedValue
//        })
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SegueNextPage" {
//
//            if let destination = segue.destination as? JillSecondViewController {
//
//                destination.loadViewIfNeeded()
//
//                destination.displayedText.firstPageText = self.textField.text!
//            }
//        }
//    }
//
//}

// --------------- Push: KVO END ---------------


// --------------- Present: Property START ---------------

class JillFirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var label: UILabel!

    @IBAction func buttonPressed(_ sender: UIButton) {

        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "JillSecondViewController") as? JillSecondViewController else { return }

        secondVC.firstPageText = textField.text!

        self.present(secondVC, animated: true, completion: nil)
    }

    var secondPageText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// --------------- Present: Property END ---------------


// --------------- Retain Cycle START ---------------

//class JillFirstViewController: UIViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    deinit {
//
//        print("JillFirst is killed.")
//    }
//}
