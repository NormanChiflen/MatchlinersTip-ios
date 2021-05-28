//
//  SearchEventsView.swift
//  UnderDog Prototype
//
//  Created by John Lee on 5/27/21.
//
import Foundation
import iLineChart
import SwiftUI
import Firebase
import UIKit

struct SearchEventsView: View {
 //   @State var posts: [Initial.Datas] = []
    @State var text = ""
    @EnvironmentObject var session: SessionStore
    @State private var isSearching = false
    
    let SportNBA = ["NBA"]
    let SportMLS = ["MLS"]
    let SportNFL = ["NFL"]
    let SportAFL = ["AFL"]
    let SportEPL = ["EPL"]
    let SportMLB = ["MLB"]
    let SportEuro  = ["Euro League"]
    let SportNHL = ["NHL"]
    let SportMMA = ["MMA"]
    let SportNRL = ["NRL"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                HStack{
                    HStack{
                        TextField("Search Sport...", text: $text)
                            .padding(.leading, 24)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .onTapGesture (perform: {
                        isSearching = true
                    })
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                                Spacer()
                            
                            if isSearching {
                                Button(action: { text = ""}, label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.vertical)
                                })
                        
                            }
                        }.padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    ).transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    if isSearching{
                        Button(action: {
                            isSearching = false
                            text = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Text("Cancel")
                            .padding(.trailing)
                            .padding(.leading, 0)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                            
                ForEach(SportAFL.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                       NavigationLink(destination: AUFootballView()) {Text("AFL 🏈 🇦🇺")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                ForEach(SportEPL.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                       NavigationLink(destination: SoccerEPLView()) {Text("EPL ⚽ 🇬🇧")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                ForEach(SportEuro.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                HStack{
                   NavigationLink(destination: EuroLeagueBBView()) {Text("Euro League 🏀 🇪🇺")}
                }.padding()
                Divider()
                    .background(Color.black)
                    .padding(.leading)
            }
                ForEach(SportMLB.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                       NavigationLink(destination: MLBView()) {Text("MLB ⚾ 🇺🇸")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                ForEach(SportMLS.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                       NavigationLink(destination: MLSView()) {Text("MLS ⚽ 🇺🇸")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                ForEach(SportMMA.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                        NavigationLink(destination: MMAView()) {Text("MMA 🥋 🇺🇸")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                ForEach(SportNBA.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                        NavigationLink(destination: NBAView()) {Text("NBA 🏀 🇺🇸")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                
                ForEach(SportNFL.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                    HStack{
                       NavigationLink(destination: NFLView()) {Text("NFL 🏈 🇺🇸")}
                    }.padding()
                    Divider()
                        .background(Color.black)
                        .padding(.leading)
                }
                
                Group {
                    ForEach(SportNHL.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                        HStack{
                            NavigationLink(destination: NHLView()) {Text("NHL 🏒 🇺🇸")}
                        }.padding()
                        Divider()
                            .background(Color.black)
                            .padding(.leading)
                    }

                        
                    ForEach(SportNRL.filter {self.text.isEmpty ? true :$0.contains(text)}, id:\.self) {String in
                        HStack{
                            NavigationLink(destination: RugbyView()) {Text("NRL 🏉 🇦🇺")}
                        }.padding()
                        Divider()
                            .background(Color.black)
                            .padding(.leading)
                        
                    }
                }
            }
            .navigationTitle("Events")
        }
    }
}
