//
//  baseballTest.swift
//  UnderDog Prototype
//
//  Created by John Lee on 6/9/21.
//

import SwiftUI

struct baseballTest: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear{
                apiBaseball().getGames()
            }
    }
}

struct baseballTest_Previews: PreviewProvider {
    static var previews: some View {
        baseballTest()
    }
}
