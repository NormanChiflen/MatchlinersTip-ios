//
//  AuthView.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/11/21.
//

import SwiftUI

struct signUpView : View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    func signUp() {
        session.signUp(email: email, password: password) { (result,error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    
    var body: some View{
        
        Image("Logo")
            .padding()

        VStack(alignment: .leading, spacing: 20){
            Text("Create Account")
                .font(.custom("NotoSans-Medium", size: 22))
                .foregroundColor(Color.gray)
                .padding()
            TextField("Email Address", text: $email)
                .padding()
            SecureField("Password", text: $password)
                .padding()
        }
            .padding(.horizontal)
            .padding(.vertical, 34)

        
        Button(action: signUp) {Text( "Sign Up")}
            .buttonStyle(largeButton())
        
        if(error != "") {
            Text(error)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
                .padding()
        }
        Spacer()
    }
}

struct loginView : View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func login() {
        session.signIn(email: email, password: password) { (result,error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View{
        
        Image("Logo")
        VStack(alignment: .leading, spacing:20){
            TextField("Email Address", text: $email)
                .padding()
            SecureField("Password", text: $password)
                .padding()
            NavigationLink(
                destination: resetPasswordView(),
                label: {
                    Text("Forget passowrd?")
                })
                .padding(.horizontal)
                
        }
        .padding(.horizontal)
        .padding(.vertical, 34)
        
        Button(action: login) { Text("Login") }
            .buttonStyle(largeButton())
            .padding(.horizontal, 32)
        
        if(error != "") {
            Text(error)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
                .padding()
        }
        Spacer()
    }
}

struct LaunchView: View {
    var body: some View {
        VStack{
            Image("BannerLogo")
                .position(x: 190, y: 50.0)
            Text("Creating the under dog story one bet at a time")
                .foregroundColor(.accentColor)
                .frame(width: 210, height: 50, alignment: .center)
                .font(.custom("NotoSans-Medium", size: 20))
                .multilineTextAlignment(.center)
                .position(x: 185.0, y: 70)
            NavigationLink(destination: signUpView(), label: {Text( "Sign Up")} )
                .position(x: 190, y: 70)
            NavigationLink(destination: loginView(), label: {Text( "Login")} )
                .position(x: 190, y: 0)
        }
            .buttonStyle(largeButton() )
            .padding()
    }
}

struct resetPasswordView : View {
    @State private var emailSent = false
    @State var email: String = ""
    @EnvironmentObject var session: SessionStore
    func resetPassword() {
        session.resetPassword(email: email)
        emailSent = true
    }
    var body: some View {
        if emailSent != false {
            VStack {
                Text("Check Your Email! If you haven't recieved a message from us, click the reset button again.")
                    .font(.custom("NotoSans-Medium", size: 18))
                    .foregroundColor(Color.gray)
                    .padding(.horizontal)
                    .padding()
            }
        }
        VStack (alignment: .center, spacing: 30){
            TextField("Email Address", text: $email)
                .padding(.horizontal)
                .padding()
            Button(action: resetPassword, label: {
                Text("Reset")
                    .padding()
            })
            .buttonStyle(largeButton())
        }
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView{
            LaunchView()
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
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

