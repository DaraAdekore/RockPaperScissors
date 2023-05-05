//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Dara Adekore on 2023-04-22.
//

import SwiftUI

enum Choice : String{
    case rock
    case scissors
    case paper
    case rockpaperscissors
}

struct ContentView: View {
    @State var userChoice = Choice.rockpaperscissors
    @State var choiceImage = Choice.rockpaperscissors
    @State var correctAnswer = Choice.rockpaperscissors
    @State var randomChoice = 0
    @State var score = 0
    @State var userWon = false
    let startingSeconds = 3
    @State var remainingSeconds = 3
    @State var timer: Timer?
    @State var gameStart = false
    var body: some View {
        VStack{
            if gameStart{
                Image(correctAnswer.rawValue)
                    .resizable()
                    .rotationEffect(.degrees(180))
                    .frame(width: 100,height: 100)
                    .padding()
                if remainingSeconds == 0 {
                    Image(choiceImage.rawValue)
                        .resizable()
                        .frame(width: 100,height: 100)
                        .padding()
                }
                else{
                    Text("\(remainingSeconds)")
                        .font(.system(size: 72))
                        .padding()
                    HStack{
                        Spacer()
                        Button(action: {
                            // action to perform when the button is tapped
                            userChoice = .rock
                        }) {
                            Image("rock")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        }
                        Spacer()
                        Button(action: {
                            // action to perform when the button is tapped
                            userChoice = .paper
                        }) {
                            Image("paper")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        }
                        Spacer()
                        Button(action: {
                            // action to perform when the button is tapped
                            userChoice = .scissors
                        }) {
                            Image("scissors")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        }
                        Spacer()
                    }
                }
            }
            Text("\(score)")
                .font(.system(size: 72))
                .padding()
            
            Button(action: {
                // Handle button tap here
                gameStart = true
                randomChoice = Int.random(in: 0..<3)
                //correctAnswer = .nothing
                startTimer()
            }) {
                Text("Shoot!")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        remainingSeconds = startingSeconds
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateTimer()
        }
    }

    func updateTimer() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
        } else {
            stopTimer()
            self.winOrLose(choice: randomChoice)
        }
    }

    func winOrLose(choice : Int){
        switch choice{
        case 0:
            if userChoice.rawValue == "paper" {
                score += 1
                choiceImage = userChoice
                correctAnswer = .rock
            }
            else{
                correctAnswer = .rock
                choiceImage = userChoice
            }
            break
        case 1:
            if userChoice.rawValue == "rock" {
                score += 1
                choiceImage = userChoice
                correctAnswer = .scissors
            }
            else{
                correctAnswer = .scissors
                choiceImage = userChoice
            }
            break
        case 2:
            if userChoice.rawValue == "scissors" {
                score += 1
                choiceImage = userChoice
                correctAnswer = .paper
            }
            else{
                correctAnswer = .paper
                choiceImage = userChoice
            }
            break
        default:
            break
        }
    }
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func getSeconds() -> Int{
        return remainingSeconds
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
