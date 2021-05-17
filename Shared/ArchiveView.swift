//
//  bettingHistory.swift
//  UnderDog Prototype
//
//  Created by John Lee on 5/17/21.
//
import Foundation
import UIKit
import SwiftUI

struct ArchiveView : View {
@EnvironmentObject var session: SessionStore
@State var posts: [Initial.Datas] = []
    func dummy(){}
    var body: some View {
        VStack(alignment: .center){
            Text("Betting History")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding()
            Spacer()
            HStack (alignment: .top, spacing: 100) {
                Button(action: dummy){Text("Win")}
                     //   .padding(7)
                       // .padding(.horizontal, 25)
                    .foregroundColor(.green)
                       // .cornerRadius(😎
                Divider()
                Button(action: dummy){Text("Lost")}
                        .foregroundColor(.red)
                     //   .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        //.padding(.leading, 😎
                                }
        }
        .font(.custom("NotoSans-Medium", size: 25))
    }
            }
struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}
