//
//  ViewController.swift
//  ImageViewer
//
//  Created by 문정호 on 2022/01/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgViewer: UIImageView!
    let maxImg=6
    var numImg=1
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgViewer.image=UIImage(named: "1.png")
    }
    @IBAction func btnPreImg(_ sender: UIButton) {
        numImg-=1
        if(numImg<1){
            numImg=6
        }
        imgViewer.image=UIImage(named: String(numImg)+".png")
    }
    @IBAction func btnNextImg(_ sender: UIButton) {
        numImg+=1
        if(numImg>maxImg){
            numImg=1
        }
        imgViewer.image=UIImage(named: String(numImg)+".png")
    }
    

}

