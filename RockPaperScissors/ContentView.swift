//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Zachary Rais-Norman on 8/15/24.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "📄", "✂️"]
    let winningMoves = ["📄", "✂️", "🪨"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    
    func checkForWin(answer: String) -> Bool {
        if (answer == winningMoves[appChoice]) {
            return true
        } else {
            return false
        }
    }
    
    func newMove() {
        appChoice = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    VStack {
                        Text("I'm gonna pick")
                        Text("\(moves[appChoice])")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                    }
                    .padding()
                    .background(.secondary.opacity(0.3))
                    .clipShape(.rect(cornerRadius: 10))
                    VStack {
                        Text("and you want to")
                        if (shouldWin) {
                            Text("WIN!")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundStyle(.green)
                        } else {
                            Text("LOSE!")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundStyle(.red)
                        }
                    }
                    .padding()
                    .background(.secondary.opacity(0.3))
                    .clipShape(.rect(cornerRadius: 10))
                }
                VStack {
                    Text("so you'd better pick...")
                    HStack(spacing: 15) {
                        ForEach(moves, id: \.self) { move in
                            Button {
                                if (moves[appChoice] == move) {
                                    // first, draw is always fail
                                } else if (checkForWin(answer: move) && shouldWin) {
                                    score += 1
                                    // at this point we know they lost, so
                                } else if (!shouldWin) {
                                    score += 1
                                }
                                newMove()
                            } label: {
                                Text(move)
                                    .font(.largeTitle)
                                    .shadow(radius: 2)
                            }
                            .frame(width: 100, height: 100)
                            .background(.thinMaterial)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: 5)
                        }
                    }
                }
                Text("Score \(score)")
            }
            .padding()
            .foregroundStyle(.white)
            .fontWeight(.bold)
        }
    }
}



#Preview {
    ContentView()
}
