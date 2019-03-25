//
//  JillFirstViewController.swift
//  Homework
//
//  Created by 渡邊君 on 2019/3/25.
//  Copyright © 2019 Jill Yeh. All rights reserved.
//

import UIKit

class JillFirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func nextPageButtonPressed(_ sender: UIButton) {
    
        // Push: Property
        performSegue(withIdentifier: "SegueNextPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueNextPage" {
            
            if let destination = segue.destination as? JillSecondViewController {
                
                destination.firstPageText = textField.text
            }
        }
    }

}
