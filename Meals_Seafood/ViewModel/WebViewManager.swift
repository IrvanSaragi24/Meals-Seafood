//
//  File.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import Foundation
import SwiftUI
import WebKit

/// A SwiftUI `UIViewRepresentable` struct for displaying a web view.
struct WebView: UIViewRepresentable {
    /// The URL to load in the web view.
    let url: URL?
    
    /// Creates and returns the `WKWebView` instance.
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = url {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    /// Updates the web view when necessary.
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    /// Creates and returns the coordinator object to manage the navigation delegate.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// The coordinator class that manages the navigation delegate of the web view.
    class Coordinator: NSObject, WKNavigationDelegate {
        /// A reference to the parent `WebView` struct.
        var parent: WebView
        
        /// Initializes the coordinator with a reference to the parent `WebView`.
        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}

