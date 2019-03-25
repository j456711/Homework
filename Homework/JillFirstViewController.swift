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

class JillFirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func nextPageButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "SegueNextPage", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueNextPage" {
            
            if let destination = segue.destination as? JillSecondViewController {
                
                destination.firstPageText = textField.text
                
                destination.dataHandler = {
                    
                    self.label.text = destination.textField.text
                }
            }
        }
    }
   
}

// --------------- Push: Closure START ---------------
