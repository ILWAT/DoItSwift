//
//  EditViewController.swift
//  Navigation
//
//  Created by 문정호 on 2022/02/07.
//

import UIKit

class EditViewController: UIViewController {
    var textWayValue: String = ""
    
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWay.text = textWayValue
    }
    @IBAction func btnDon(_ sender: UIButton) {
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
