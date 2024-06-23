//
//  ContentView.swift
//  H4X0R
//
//  Created by Harry Xiong on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
      
           
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
            }
            .navigationBarTitle("H4X0R NEWS")
        }

        .background(.white).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
