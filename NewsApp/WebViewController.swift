//
//  WebViewController.swift
//  NewsApp
//
//  Created by Mac on 01/05/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    var urlLink:String!
    var webview: WKWebView!
    
    override func loadView() {
        webview = WKWebView()
        webview.navigationDelegate = self
        view = webview
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let url = URL(string: urlLink)!
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
    }
   

}
