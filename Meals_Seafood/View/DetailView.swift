//
//  DetailView.swift
//  Meals_Seafood
//
//  Created by Irvan P. Saragi on 18/12/23.
//

import SwiftUI
import SDWebImageSwiftUI
import WebKit


struct DetailView: View {
    let mealID: String
    @State private var mealDetail: MealDetail?

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if let mealDetail = mealDetail {
                    Text(mealDetail.strMeal)
                        .font(.title)
                    WebImage(url: URL(string: mealDetail.strMealThumb))
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                    WebView(url: URL(string: mealDetail.strYoutube))
                                    .frame(height: 300)
                    Text("Instructions:")
                        .font(.headline)
                    Text(mealDetail.strInstructions)
                        .padding()

                } else {
                   ProgressView()
                }
            }
            .onAppear {
                APIDetailManager.getMealDetail(mealID: mealID) { detail in
                    if let detail = detail {
                        mealDetail = detail
                    }
                }
            }
        }
    }
}

#Preview {
    DetailView(mealID: "52772")
}

struct WebView: UIViewRepresentable {
    let url: URL?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = url {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}
