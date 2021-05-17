//
//  OnGoing.swift
//  UnderDog Prototype
//
//  Created by John Lee on 5/13/21.
//

import SwiftUI

struct ConfirmOrder: View {
    @State var team_Name1 : String  = ""
    @State var team_Name2 : String = ""
    @State var ExpectedEarning : Double = 0
    @State var TotalGain : Double = 0
    @State var value : String = ""
    @State var SelectedOdd: Double = 0
    @EnvironmentObject var session: SessionStore
    @State var isPressed: Bool = true;
    var body: some View {
        Color.neonPurple.opacity(0.9).ignoresSafeArea()
            .overlay(
                VStack{
                    Section{
                        Text("Order Summary")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    .padding()
                    Section{
                        HStack{
                            Text("\(team_Name1)  vs  \(team_Name2)")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 25))
                                .foregroundColor(.lightGray)
                        }
                        HStack{
                            Text("Odds Selected: \(SelectedOdd, specifier:"%.2f")%")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 25))
                                .foregroundColor(.lightGray)
                        }
                    }
                    .padding()
                    Section{
                        Text("Winnings: $\(ExpectedEarning,specifier:"%.2f")")
                            .foregroundColor(.green)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 30))
                            .shadow(color: Color("Button Color"), radius: 10)
                        Text("Betting amount: $\(Double(value) ??  0,specifier:"%.2f")")
                            .foregroundColor(.lightGray)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 25))
                    }
                    .padding()
                    Section{
                        Text("Total Gain: $\(TotalGain,specifier:"%.2f")")
                            .foregroundColor(.lightGray)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    Button(action: {self.isPressed.toggle() }, label: {
                      Text("Confirm")
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .blendMode(.overlay)
                    })
                    .frame(maxWidth: 350, minHeight: 44)
                    .background(Color("Button Color"))
                    .cornerRadius(14)
                    .shadow(color: Color("Button Color"), radius: self.isPressed ? 5: 30, x: self.isPressed ? -5: -10, y: self.isPressed ? -5: -10)
                    .shadow(color: Color.darkBlue, radius: self.isPressed ? 5: 30, x: self.isPressed ? 5: 10, y: self.isPressed ? 5: 10)
                    .scaleEffect(self.isPressed ? 0.98: 1)
                    .animation(.spring())
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    Spacer()
                })
    }
}

struct ConfirmOrder_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrder()
    }
}
