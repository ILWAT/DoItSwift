//
//  ViewController.swift
//  PageControl
//
//  Created by 문정호 on 2022/02/01.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages=images.count
        
        pageControl.currentPage=0
        
        pageControl.pageIndicatorTintColor=UIColor.green
        
        pageControl.currentPageIndicatorTintColor=UIColor.red
        
        imgView.image=UIImage(named: images[0])
    }
    
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image=UIImage(named: images[pageControl.currentPage])
    }
}

