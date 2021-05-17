//
//  OnGoing.swift
//  UnderDog Prototype
//
//  Created by John Lee on 5/13/21.
//

import SwiftUI

struct OnGoing: View {
    @State var team_Name1 : String  = ""
    @State var team_Name2 : String = ""
    @State var SelectedOdd: Double = 0
    @State var ExpectedEarning : Double = 0
    @State var value : String = ""
    // create order array
    var body: some View {
        VStack{
            // ForEach(order)
            Text("\(team_Name1)  vs  \(team_Name2)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text("Odds: \(SelectedOdd,specifier:"%.2f")%")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text("Wager: $\(Double(value) ?? 0,specifier:"%.2f")")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text("Winner")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text("(Incl. OT)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text("Potential Winnings: $\(ExpectedEarning,specifier:"%.2f")")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Divider()
        }
    }
}

struct OnGoing_Previews: PreviewProvider {
    static var previews: some View {
        OnGoing()
    }
}
