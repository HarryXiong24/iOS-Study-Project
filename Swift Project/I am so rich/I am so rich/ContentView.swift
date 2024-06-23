//
//  ContentView.swift
//  I am so rich
//
//  Created by Harry Xiong on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.lightGray).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("I am rich!").font(.system(size: 40)).foregroundColor(Color.orange)
                Image("diamond")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
