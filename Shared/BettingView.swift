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
    @State private var Odds = 2
    @State var OddsAmount: [Double]
    
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
           // Form {
                Section{
                    HStack(spacing: 50){
                        VStack{
                            Text("Gain")
                            Text("$\(ExpectedEarnings,specifier:"%.2f")")
                        }
                        VStack{
                            Text("Total")
                            Text("$\(TotalGain,specifier:"%.2f")")
                        }
                    }
                }
                Section{
                    Picker("Odd Selection", selection: $Odds){
                        ForEach(0..<OddsAmount.count){
                            Text("\(self.OddsAmount[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                Section{
                    Text("Betting Amount: " + value)
                        .foregroundColor(.yellow)
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
                    .padding()
                }
            }
            .padding()
        }
    }
    func didTap(button: CalcButton) {
            switch button {
   //         case .add, .subtract, .multiply, .divide, .equal:
      //          if button == .add {
        //            self.currentOperation = .add
          //          self.runningNumber = Int(self.value) ?? 0
            //    }
            //    else if button == .subtract {
              //      self.currentOperation = .subtract
               //     self.runningNumber = Int(self.value) ?? 0
               // }
             //   else if button == .multiply {
               //     self.currentOperation = .multiply
                 //   self.runningNumber = Int(self.value) ?? 0
               // }
               // else if button == .divide {
                 //   self.currentOperation = .divide
                  //  self.runningNumber = Int(self.value) ?? 0
                //}
           //     else if button == .equal {
             //       let runningValue = self.runningNumber
              //      let currentValue = Int(self.value) ?? 0
              //      switch self.currentOperation {
                //    case .add: self.value = "\(runningValue + currentValue)"
               //     case .subtract: self.value = "\(runningValue - currentValue)"
                 //   case .multiply: self.value = "\(runningValue * currentValue)"
                   // case .divide: self.value = "\(runningValue / currentValue)"
                   // case .none:
                    //    break
            //}
              //  }

               // if button != .equal {
                 //   self.value = "0"
               // }
            case .clear:
                self.value = "0"
           // case .decimal: self.value = "."
    //, .negative, .percent:
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
        
}
