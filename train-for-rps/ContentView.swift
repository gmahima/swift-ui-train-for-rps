//
//  ContentView.swift
//  train-for-rps
//
//  Created by Mahima Gangavarapu on 03/07/21.
//

import SwiftUI

struct ContentView: View {

    var choices = ["rock", "paper", "scissors"]
    @State var appChoice: Int = Int.random(in: 0...2)
    @State var shouldWin: Bool = Bool.random()
    @State var showGameStatus: Bool = false
    var maxTurns = 10
    @State var turn = 1
    @State var score = 0
    
    
    func handleThrow (choice: Int) {
        if turn <= maxTurns {
            print(choice)
            if(shouldWin) {
                switch(appChoice) {
                case 0: if(choice == 1) {
                    score += 1
                }
                else {
                    score += -1
                }
                case 1: if(choice == 2) {
                    score += 1
                }
                else {
                    score += -1
                }
                case 2: if(choice == 0) {
                    score += 1
                }
                else {
                    score += -1
                }
                default: print("error")
                }
            }
            else {
                switch(appChoice) {
                case 0: if(choice == 2) {
                    score += 1
                }
                else {
                    score += -1
                }
                case 1: if(choice == 0) {
                    score += 1
                }
                else {
                    score += -1
                }
                case 2: if(choice == 1) {
                    score += 1
                }
                else {
                    score += -1
                }
                default: print("error")
                }
        }
        turn += 1
        if(turn <= maxTurns) {
            appChoice = Int.random(in: 0...2)
            shouldWin = Bool.random()
        }
            if(turn > maxTurns) {
                showGameStatus = true
            }
    }
    }
    var body: some View {
        VStack{
            VStack(content: {
                Text("let's get you trained for rock paper sissors")
                Text("Turn \(turn < maxTurns ? turn : maxTurns) of \(maxTurns)")
                VStack{
                    Text("Play to")
                    if (shouldWin) {
                      Text("win")
                    }
                    else {
                        Text("lose")
                    }
                    Text("against \(choices[appChoice])")


                }
            })
            VStack {
                Text("throw")
                HStack {
                    ForEach(0..<choices.count, content: {
                        choice in
                        Button(choices[choice], action: {
                           handleThrow(choice: choice)
                        }).disabled(turn > maxTurns ? true : false)
                    })
                }
                Text("score: \(score)")
            }


        }.alert(isPresented: $showGameStatus, content: {
            Alert(title: Text("End of game"), message: Text("Your score is \(score)"), dismissButton: .default(Text("OK")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

