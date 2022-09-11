//
//  showVideoViewController.swift
//  Fitness App
//
//  Created by Mustafa on 4.09.2022.
//

import UIKit
import WebKit

class showVideoViewController: UIViewController {

    private let webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        return webView
    }()
    
    var urlString: String = "https://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(webView)
        let url = URL(string: urlString)
        if let url = url {
            webView.load(URLRequest(url: url))
        }
        configureButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    private func configureButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))
    }
    
    @objc func didTapDone() {
        dismiss(animated: true)
    }
    
    @objc func didTapRefresh() {
        
        let currentUrl = URL(string: urlString)
        webView.load(URLRequest(url: currentUrl!))
    }
}
