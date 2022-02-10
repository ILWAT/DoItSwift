//
//  EditViewController.swift
//  Navigation
//
//  Created by 문정호 on 2022/02/07.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_controller: EditViewController, message: String)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWay.text = textWayValue
        txMessage.text = textMessage
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(_controller: self, message: txMessage.text!)
        }
        _=navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
