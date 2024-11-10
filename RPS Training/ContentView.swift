//
//  ContentView.swift
//  RPS Training
//
//  Created by pranay vohra on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    var selectionArray=["rock","paper","scissors"]
    var toWinArray=["Win","Lose"]
    @State private var systemMove=Int.random(in: 0...2)
    @State private var Aim=Int.random(in: 0...1)
    @State private var score=0
    @State private var titleCard=""
    @State private var isAlert=false
    var userSelectedInput=""
    
    
    var body: some View {
        ZStack{
            //color
            LinearGradient(colors: [.indigo,.cyan,.blue,.purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("✊📃✂️")
                    .font(.largeTitle.bold())
                Text("Brain-Trainer")
                    .font(.largeTitle.bold())
                
                
                Spacer()
                
                
                Text("Aim: To \(toWinArray[Aim])")
                    .font(.subheadline.weight(.heavy))
                   
                
                Spacer()
                Spacer()
                VStack{
                    
                    Text("Your Opponent Chose")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    
                    Text(selectionArray[systemMove].capitalized)
                        .font(.title.weight(.bold))
                    
                    
                    HStack(spacing:15) {
                        
                        ForEach(0..<3){ number in
                            Button{
                                buttonTapped(number)
                                
                            }label: {
                                Image(selectionArray[number])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        
                        
                    }
                    .clipShape(.capsule)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 50))
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                
                Spacer()
                
            }
            .alert(titleCard, isPresented: $isAlert){
                Button("continue",action: askAgain)
            }message: {
                Text("Your score is \(score)")
            }
          
           
            
        }
    }
    
    func askAgain(){
        systemMove=Int.random(in: 0...2)
        Aim=Int.random(in: 0...1)
        titleCard = ""
    }
    
    func buttonTapped( _ num:Int){
        if(num==(systemMove+1)%selectionArray.count && Aim==0){
            titleCard="Correct Move"
            score+=1
            isAlert=true
        }else if Aim == 1 && num != (systemMove + 1) % selectionArray.count {
            titleCard="Correct Move"
            score+=1
            isAlert=true
        }else{
            titleCard="Wrong Move"
            score=0
            isAlert=true
        }
    }
    
}




#Preview {
    ContentView()
}
