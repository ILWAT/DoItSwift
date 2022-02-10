//
//  ViewController.swift
//  Navigation
//
//  Created by 문정호 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.delegate = self
    }

    func didMessageEditDone(_controller: EditViewController, message: String) {
        txMessage.text = message
        }

}

