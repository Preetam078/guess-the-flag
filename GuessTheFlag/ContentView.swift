//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Preetam Mondal on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: Array<String> = ["Estonia", "France", "Germany", "Italy", "Spain", "Ireland", "Poland", "Nigeria", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer: Int = Int.random(in: 0...2)
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = "??"
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red:0.1, green: 0.2, blue: 0.45 ), location: 0.3),
                .init(color: .red, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text("Guess the Flag")
                    .font(.title.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        }label: {
                            Image(self.countries[number])
                                .cornerRadius(CGFloat(10))
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                VStack {
                    Text("Your Response is \(scoreTitle)")
                        
                }
                Spacer()
                Spacer()
            }
            .padding()
                
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }message: {
            Text("Your score is ???")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        }
        else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
        scoreTitle = "??"
        
    }
}

#Preview {
    ContentView()
}

