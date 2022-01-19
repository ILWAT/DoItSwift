//
//  ViewController.swift
//  WebViewVsWorkFlowy
//
//  Created by ILWAT on 2022/01/17.
//
// 웹 뷰로 스토리보드의 전체 화면을 채우고 앱이 시작될 때 HTML 파일을 읽어 디스플레이하고 링크를 걸어 workflowy.com으로 이동하게 만들어 보세요. 그리고 실제로 앱스토어에서 워크플로위(workFlowy) 앱을 다운로드한 후 어떤 차이가 있는지 확인해 보세요.

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url:String){
        let myUrl=URL(string: url)
        let myRequest=URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    func loadHtmlFile(){
        let filePath=Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl=URL(fileURLWithPath: filePath!)
        let myRequest=URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate=self
        loadHtmlFile()
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden=false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
}

