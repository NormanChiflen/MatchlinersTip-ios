import Foundation
import SwiftUI
import UIKit
import Combine

// Creating the NumberPad
enum CalcButton: String
{
    case zero  = "0"
    case one   = "1"
    case two   = "2"
    case three = "3"
    case four  = "4"
    case five  = "5"
    case six   = "6"
    case seven = "7"
    case eight = "8"
    case nine  = "9"
    case clear = "<-"
    case decimal = "."
    
    var buttonColor: Color {
        switch self{
        case .clear
        :return .orange
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}


struct BettingView: View {
    @EnvironmentObject var session: SessionStore
    @State var value = "0"
    @State var runningNumber = 0
    @State private var WinningAmount = ""
    @State private var Odds = 0
    @State var OddsAmount: [Double]
    @State var showingAlert = false
    @State var team_Name1 = ""
    @State var team_Name2 = ""
    @State private var showSheet = false
    @State var date = Date()
    @Binding var bottomSheetShown: Bool
//    @State var SelectedOdd : Double = 0
    
    var ExpectedEarnings: Double {
    let OddSelection = Double(OddsAmount[Odds])
    let BettingAmount = Double(value) ?? 0
    var BettingValue = Double(0)
        if(OddSelection < 0){
            BettingValue = BettingAmount / abs(OddSelection)
        }
        else{
            BettingValue = BettingAmount * OddSelection
        }
    let Winnings = BettingValue
    return Winnings
    }
    
    var TotalGain: Double {
    let OddSelection = Double(OddsAmount[Odds])
    let BettingAmount = Double(value) ?? 0
    var BettingValue = Double(0)
        if(OddSelection < 0){
            BettingValue = BettingAmount / abs(OddSelection)
        }
        else{
            BettingValue = BettingAmount * OddSelection
        }
    let TotalGain = BettingValue + BettingAmount
    return TotalGain
    }
    
    let buttons: [[CalcButton]] = [
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three],
        [.decimal ,.zero, .clear],
    ]

    var body: some View {
        VStack {
            HStack(spacing: 50){
                VStack{
                    Text("Gain")
                        .foregroundColor(.white)
                    Text("$\(ExpectedEarnings,specifier:"%.2f")")
                        .foregroundColor(.white)
                }
                VStack{
                    Text("Total")
                        .foregroundColor(.white)
                    Text("$\(TotalGain,specifier:"%.2f")")
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom)
            HStack(spacing: 100){
                Text("\(team_Name1)")
                    .foregroundColor(.lightPurple)
                Text("\(team_Name2)")
                    .foregroundColor(.lightPurple)
            }
            Section{
                Picker("Odd Selection", selection: $Odds){
                    ForEach(0..<OddsAmount.count){
                        Text("\(self.OddsAmount[$0], specifier: "%.3f")%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            HStack(spacing: 95){
                ForEach(0..<OddsAmount.count) {
                    if($0 % 2 == 0){
                        Text("W")
                            .foregroundColor(.green)
                    }
                    else{
                        Text("L")
                            .foregroundColor(.red)
                    }
                }
            }
            Section{
                Text("Betting Amount: " + value)
                    .foregroundColor(.yellow)
            }
            .padding()
            Section{
                Button("Place Bet") {
                    if(Double(session.profile?.score ?? 0) < Double(value) ?? 0 || Double(value) == 0 ) {
                        showingAlert = true;
                    }
                    else{
                        showSheet.toggle()
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Not enough points"), message: Text("You do not have enough points to place this bet"), dismissButton: .default(Text("Got it!")))
                }
                .sheet(isPresented: $showSheet) {
                    let SelectedOdd = Double(OddsAmount[Odds])
                    ConfirmOrder(team_Name1:team_Name1, team_Name2:team_Name2, ExpectedEarning: ExpectedEarnings, TotalGain: TotalGain, value: value, SelectedOdd: SelectedOdd, date: Date(), showSheet: $showSheet, bottomSheetShown: $bottomSheetShown)
                        }
                .buttonStyle(largeButton() )
                .padding()
            }
            VStack {
                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 25) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))

                                   .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight())
                                    //
                                    .foregroundColor(.green)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                }
            }
        }
    }
    func didTap(button: CalcButton) {
            switch button {
            case .clear:
                self.value = "0"
            default:
                let number = button.rawValue
                if self.value == "0" {
                    value = number
                }
                else {
                    self.value = "\(self.value)\(number)"
                }
            }
        }

        func buttonWidth(item: CalcButton) -> CGFloat {
            return (UIScreen.main.bounds.width - (5*12)) / 4
        }

        func buttonHeight() -> CGFloat {
            return (UIScreen.main.bounds.width - (5*12)) / 4
        }
        
//    func executeOrder() {
//        
//    }
}
