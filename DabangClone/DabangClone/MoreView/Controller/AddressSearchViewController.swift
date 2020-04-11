//
//  AddressSearchViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//
// AIzaSyCYn9UxnPgTtI_ZENRxQxbgtNCe9HUTank

import UIKit
import WebKit
import SnapKit
import Then
class AddressSearchViewController: UIViewController , WKScriptMessageHandler {
  
  var webView: WKWebView?
  let indicator = UIActivityIndicatorView(style: .medium)
  let unwind = "unwind"
  
  var postCode = ""
  var address = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard
      let url = URL(string: "https://trilliwon.github.io/postcode/"),
      let webView = webView
      else { return }
    
    let request = URLRequest(url: url)
    webView.load(request)
    
    self.webView?.navigationDelegate = self
    indicator.startAnimating()
  }
  
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//
    if let postCodData = message.body as? [String: Any] {
      print(postCodData)
      postCode = postCodData["zonecode"] as? String ?? ""
      address = postCodData["addr"] as? String ?? ""

    }
    print(postCode)
    print(address)
  }

}


extension AddressSearchViewController: WKUIDelegate ,  WKNavigationDelegate {
  override func loadView() {
    let contentController = WKUserContentController()
    contentController.add(self, name: "callBackHandler")
    
    let config = WKWebViewConfiguration()
    config.userContentController = contentController
    
    self.webView = WKWebView(frame: .zero, configuration: config)
    self.view = self.webView!
    self.webView?.navigationDelegate = self
    
    self.webView?.addSubview(indicator)
    indicator.center.x = UIScreen.main.bounds.width/2
    indicator.center.y = UIScreen.main.bounds.height/2
  }
  
  //  //Mark: - Indicator Animating
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    
    indicator.startAnimating()
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    indicator.stopAnimating()
  }
  
}
