//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Harry Xiong on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background").resizable().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }, label: {
                    Text("Roll").font(.system(size: 40)).fontWeight(.bold).foregroundColor(Color.white).padding(.horizontal)
                }).background(.red)
            }.padding()
            
        }
    }
}

struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)").resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
