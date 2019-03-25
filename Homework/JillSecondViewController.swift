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

protocol TextDelegate: AnyObject {
    
    func passData(_ viewController: JillSecondViewController)
}

class JillSecondViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func lastPageButtonPressed(_ sender: UIButton) {
        
        self.delegate?.passData(self)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    var firstPageText: String?
    
    weak var delegate: TextDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        label.text = firstPageText
    }
}

// --------------- Push: Delegate END ---------------
