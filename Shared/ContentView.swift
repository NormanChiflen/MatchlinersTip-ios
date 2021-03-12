//
//  ContentView.swift
//  Shared
//
//  Created by John Lee on 2/27/21.
//

import SwiftUI
import Firebase

struct ContentView: View {

    var body: some View {
        launchScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct launchScreen : View {
    var body: some View {
        NavigationView{
            VStack{
                Image("BannerLogo")
                    .position(x: 190, y: 50.0)
                Text("Creating the under dog story one bet at a time")
                    .foregroundColor(Color("Custom Color 1"))
                    .frame(width: 200, height: 50, alignment: .center)
                    .font(.custom("NotoSans-Medium", size: 18))
                    .multilineTextAlignment(.center)
                    .position(x: 185.0, y: 70)
                NavigationLink(destination: signUpScreen(), label: {Text( "Sign Up")} )
                    .position(x: 190, y: 70)
                NavigationLink(destination: loginScreen(), label: {Text( "Login")} )
                    .position(x: 190, y: 0)
            }
            .buttonStyle(largeButton() )
            .padding()
        
        }
    }
}

struct loginScreen : View {
    @State var username = ""
    @State var password = ""
    var body: some View{
        VStack{
//            Banner()
            // back button //
            Image("Logo")
                .padding()
            TextField("Username", text: $username)
                .padding()
            SecureField("Password", text: $password)
                .padding()
            Button(action: { print("Login in")}) {Text( "Login")}
                .buttonStyle(largeButton())
        }
        .padding()
    }
}

struct signUpScreen : View {
    @State var username = ""
    @State var password = ""
    var body: some View{
        VStack{
//            Banner()
            // back button //
            Image("Logo")
                .padding()
            TextField("Username", text: $username)
                .padding()
            SecureField("Password", text: $password)
                .padding()
            Button(action: { print("Sign Up")}) {Text( "Sign Up")}
                .buttonStyle(largeButton())
        }
        .padding()
    }
}

struct largeButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .foregroundColor(Color.white)
        .frame(maxWidth: 350, minHeight: 44)
        .cornerRadius(6)
        .background(Color("Button Color"))
        .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(Color("Button Color"), lineWidth: 4))
        .font(.custom("NotoSans-Medium", size: 18))
    }
}
