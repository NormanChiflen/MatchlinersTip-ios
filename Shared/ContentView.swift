//
//  ContentView.swift
//  Shared
//
//  Created by John Lee on 2/27/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    func getUser() {
        session.listen()
    }
    var body: some View {
        Group {
            if(session.session != nil){
                VStack{
                    Text("Welcome Back!")
                        .padding()
                    Button(action: session.signOut){
                        Text("Sign Out")
                    }
                }
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}

