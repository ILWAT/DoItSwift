//
//  ViewController.swift
//  PageControlMission
//
//  Created by 문정호 on 2022/02/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var lblNumber: UILabel!
    
    var number = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = number.count
        
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor=UIColor.green
        
        pageControl.currentPageIndicatorTintColor=UIColor.blue
        
        //lblNumber.text = String(pageControl.currentPage+1)
        lblNumber.text = number[pageControl.currentPage]
    }


    
   
    @IBAction func pageChange(_ sender: UIPageControl) {
        //lblNumber.text=String(pageControl.currentPage+1)
        lblNumber.text=number[pageControl.currentPage]
    }
}

