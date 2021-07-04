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
    @State var didWinLastRound: Bool?
    
    func handleThrow (choice: Int) {
        if turn <= maxTurns {
            print(choice)
            if(shouldWin) {
                switch(appChoice) {
                case 0: if(choice == 1) {
                    score += 1
                    didWinLastRound = true
                }
                else {
                    score += -1
                    didWinLastRound = false
                }
                case 1: if(choice == 2) {
                    score += 1
                    didWinLastRound = true
                }
                else {
                    score += -1
                    didWinLastRound = false
                }
                case 2: if(choice == 0) {
                    score += 1
                    didWinLastRound = true
                }
                else {
                    score += -1
                    didWinLastRound = false
                }
                default: print("error")
                }
            }
            else {
                switch(appChoice) {
                case 0: if(choice == 2) {
                    score += 1
                    didWinLastRound = true
                }
                else {
                    score += -1
                    didWinLastRound = false
                }
                case 1: if(choice == 0) {
                    score += 1
                    didWinLastRound = true
                }
                else {
                    score += -1
                    didWinLastRound = false
                }
                case 2: if(choice == 1) {
                    score += 1
                    didWinLastRound = true
                }
                else {
                    score += -1
                    didWinLastRound = false
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
                Text("train for rock paper sissors").font(.largeTitle)
                Text("Turn \(turn < maxTurns ? turn : maxTurns) of \(maxTurns)")
                VStack{
                    Text("Play to")
                    if (shouldWin) {
                        Text("win").padding().background(Color.green).foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    else {
                        Text("lose").padding().background(Color.red).foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    Text("against \(choices[appChoice])").padding().background(Color.black).foregroundColor(.white).clipShape(Capsule())


                }
            })
            VStack {
                Text("throw")
                HStack {
                    ForEach(0..<choices.count, content: {
                        choice in
                        Button(choices[choice], action: {
                           handleThrow(choice: choice)
                        }).padding().background(turn <= maxTurns ? Color.blue : Color.gray).clipShape(Capsule()).foregroundColor(.white).disabled(turn > maxTurns ? true : false)
                    })
                }
                Text("score: \(score)").foregroundColor(didWinLastRound == nil ? Color.blue : (didWinLastRound! == true ? Color.green : Color.red))
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

