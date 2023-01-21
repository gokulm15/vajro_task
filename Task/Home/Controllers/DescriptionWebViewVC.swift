//
//  DescriptionWebViewVC.swift
//  Task
//
//  Created by Apple on 21/01/2023.
//

import UIKit
import WebKit
class DescriptionWebViewVC: UIViewController, WKNavigationDelegate {
    lazy var webView: WKWebView = {
       let webConfig = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    let activityView = UIActivityIndicatorView(style: .large)
    var htmlString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiConfig()
        showActivityIndicatory()
        webView.navigationDelegate = self
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    func showActivityIndicatory() {
        self.view.addSubview(activityView)
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: 80, height: 80) // Set X and Y whatever you want
        container.backgroundColor = .clear
        activityView.center = self.view.center
        container.addSubview(activityView)
        self.view.addSubview(container)
        activityView.startAnimating()
    }
    func uiConfig(){
        let barBtn = UIBarButtonItem(image: UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(closeAction))
        self.navigationItem.rightBarButtonItem = barBtn
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
                   webView.topAnchor
                       .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                   webView.leadingAnchor
                       .constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                   webView.bottomAnchor
                       .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                   webView.trailingAnchor
                       .constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
               ])
    }
    @objc func closeAction(){
        self.dismiss(animated: true)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityView.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityView.stopAnimating()
    }
}
