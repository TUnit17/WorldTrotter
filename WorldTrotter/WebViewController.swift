//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Timothy Huang on 3/23/17.
//  Copyright © 2017 Timothy Huang. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController{
    
    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        let myURL = URL(string:"https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        view = webView
    }
}
