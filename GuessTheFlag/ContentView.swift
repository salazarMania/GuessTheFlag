//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SANIYA KHATARKAR on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State var userScore = 0
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops:[.init(color: Color(red: 0.1,green:0.2, blue:0.45), location: 0.3),
                                  .init(color: Color(red:0.76, green:0.15, blue:0.2), location: 0.3)] , center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                        
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    ForEach(0..<3){
                        number in
                        Button{
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                //            .clipShape(Shape: Rectangle)
                
                Spacer()
                Spacer()
//                Text("Score : ???")
//                    .foregroundStyle(.white)
//                    .font(.title.bold())
//                Spacer()
                    
    
            }
            .padding()
            .alert(scoreTitle, isPresented: $showingScore){
                Button("Continue", action: askQuestion)
            }
        }
    }
    func flagTapped(_ number : Int){
        if number == correctAnswer{
            scoreTitle = "Correct!!"
        }
        else{
            scoreTitle="Wrong :/"
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
