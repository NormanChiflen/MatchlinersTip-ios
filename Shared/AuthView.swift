//
//  AuthView.swift
//  UnderDog Prototype
//
//  Created by John Lee on 3/11/21.
//
import UIKit
import SwiftUI

struct signUpView : View {
    @State var email: String = ""
    @State var displayName: String = ""
    @State var state: String = ""
    @State var error: String = ""
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View{
        
        Image("Logo")
            .padding()

        VStack(alignment: .leading, spacing: 20){
            Text("Create Account")
                .font(.custom("NotoSans-bold", size: 22))
                .foregroundColor(.accentColor)
                .padding()
            TextField("Nickname", text: $displayName)
                .padding()
            TextField("Email Address", text: $email)
                .padding()
            TextField("State", text: $state)
                .padding()
        }
            .padding(.horizontal)
            .padding(.vertical, 34)

        NavigationLink(destination: ageVerifyView(email: email, displayName: displayName, state: state) ) {Text( "Next")}
            .disabled(email.isEmpty || displayName.isEmpty || state.isEmpty)
            .buttonStyle(largeButton() )
        
        if(error != "") {
            Text(error)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
                .padding()
        }
        Spacer()
    }
}

struct ageVerifyView: View {
    @State var age: Int = 0
    @State var email: String = ""
    @State var displayName: String = ""
    @State var state: String = ""
    @State private var color = Color.red
    @State private var calcAge: DateComponents = DateComponents()

    @EnvironmentObject var session: SessionStore

    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    @State private var birthDate = Date()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Enter Your Birthday")
                .font(.custom("NotoSans-Medium", size: 22))
                .foregroundColor(Color.gray)
            Text("Users must be at least 18 years old to play and in some states users are required to be older")
                .font(.custom("NotoSans-Medium", size: 15))
                .foregroundColor(Color.gray)
                .padding()
        }
        VStack(alignment: .leading, spacing: 20){
            DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
        }.onChange(of: birthDate, perform: { value in
            calcAge = Calendar.current.dateComponents([.year, .month, .day], from: birthDate, to: Date())
            age = calcAge.year ?? 0
        })
        Text("Your Age: \(calcAge.year ?? 0)")
            .bold()
            .foregroundColor(Color.white)
            .colorMultiply(self.color)
            .padding()
            .onTapGesture{
                withAnimation(.easeInOut(duration: 1)) {
                    self.color = Color.blue
                }
            }
        NavigationLink(destination: preferenceView(email: email, displayName: displayName, state: state, age: age)) {
                                Text("Next")
        }.disabled(calcAge.year ?? 0 < 18)
            .buttonStyle(largeButton() )
    }
}

struct preferenceView: View{
    @State var email: String = ""
    @State var displayName: String = ""
    @State var state: String = ""
    @State var age: Int = 0
    @State var NCAAF: Bool = false
    @State var AFL: Bool = false
    @State var MLB: Bool = false
    @State var NBA: Bool = false
    @State var NHL: Bool = false
    @State var Euroleague: Bool = false
    @State var MMA: Bool = false
    @State var NRL: Bool = false
    @State var EPL: Bool = false
    @State var MLS: Bool = false
    

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10){
            Spacer()
            Text("Preference")
                .font(.custom("NotoSans-Medium", size: 22))
                .foregroundColor(Color.gray)
                .padding()
            Text("Setting up your preference will send you directly to bets that make sense for you")
                .font(.custom("NotoSans-Medium", size: 15))
                .foregroundColor(Color.gray)
                .padding()
            Menu{
                Menu{
                    Toggle(isOn: $NCAAF, label: {
                        Text("NCAAF 🇺🇸")
                    })
                    .padding()
                    Toggle(isOn: $AFL, label: {
                        Text("AFL 🇦🇺")
                    })
                }label: {
                    Text("Football 🏈")
                }
                Menu{
                    Button("EPL 🇬🇧") {
                        EPL = true
                    }
                }label: {
                    Text("Soccer ⚽")
                }
                Menu{
                    Button("NBA 🇺🇸") {
                        NBA = true
                    }
                    Button("Euro League 🇪🇺"){
                        Euroleague = true
                    }
                }label: {
                    Text("Basketball 🏀")
               }
                Menu{
                    Button("MLB 🇺🇸") {
                        MLB = true
                    }
                }label: {
                    Text("Baseball ⚾")
               }
                Menu{
                    Button("NHL 🇺🇸") {
                        NHL = true
                    }
                }label: {
                    Text("Ice Hockey 🏒")
               }
                Menu{
                    Button("MMA 🥋") {
                        MMA = true
                    }
                }label: {
                    Text("MMA 🥋")
               }
                Menu{
                    Button("NRL 🇦🇺") {
                        NRL = true
                    }
                }label: {
                    Text("Rugby 🏉")
               }

            }label: {
                Label("Sports", systemImage: "sportscourt")
                    .accentColor(.blue)
                    .font(.system(size: 22, weight: .semibold))
           }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            ScrollView{
                LazyVGrid(columns: columns){
                    Toggle(isOn: $NCAAF, label: {
                        Text("NCAAF 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $AFL, label: {
                        Text("AFL 🇦🇺")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $MLB, label: {
                        Text("MLB 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $NBA, label: {
                        Text("NBA 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $Euroleague, label: {
                        Text("Euro League 🇪🇺")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $NHL, label: {
                        Text("NHL 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $MMA, label: {
                        Text("MMA 🥋")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $NRL, label: {
                        Text("NRL 🇦🇺")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $EPL, label: {
                        Text("EPL 🇬🇧")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                    Toggle(isOn: $MLS, label: {
                        Text("MLS 🇺🇸")
                    })
                    .padding()
                    .toggleStyle(CheckboxStyle())
                }
                NavigationLink(destination: confirmPasswordView(email: email, displayName: displayName, state: state, age: age, NCAAF: NCAAF, AFL: AFL, MLB: MLB, NBA: NBA, NHL: NHL, Euroleague: Euroleague, MMA: MMA, NRL: NRL, EPL: EPL, MLS: MLS)) {
                                        Text("Next")
                }
                .buttonStyle(largeButton())
                .padding()
            }
    
        }
    }
}

struct CheckboxStyle: ToggleStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
 
        return HStack {
 
            configuration.label
 
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? .purple : .gray)
                .font(.system(size: 10, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
 
    }
}

struct confirmPasswordView: View {
    @State var password: String = ""
    @State var rpassword: String = ""
    @State var email: String = ""
    @State var displayName: String = ""
    @State var state: String = ""
    @State var age: Int = 0
    @State var error: String = ""
    @State var score: Int = 20 //Free money
    @State var NCAAF: Bool = false
    @State var AFL: Bool = false
    @State var MLB: Bool = false
    @State var NBA: Bool = false
    @State var NHL: Bool = false
    @State var Euroleague: Bool = false
    @State var MMA: Bool = false
    @State var NRL: Bool = false
    @State var EPL: Bool = false
    @State var MLS: Bool = false
    
    @State var profile: UserProfile?
    @State var preference: preference?
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password, displayName: displayName, State: state, age: age, score: score, NCAAF: NCAAF, AFL: AFL, MLB: MLB, NBA: NBA, NHL: NHL, Euroleague: Euroleague, MMA: MMA, NRL: NRL, EPL: EPL, MLS: MLS) { (profile, preference, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.profile = profile
                print(profile!)
                self.email = ""
                self.password = ""
                self.preference = preference
            }
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            SecureField("Password", text: $password)
                .padding()
            SecureField("Re-enter Password", text: $rpassword)
                .padding()
        }
        .padding()
        Button(action: signUp) {Text( "Sign Up")}
            .disabled(password != rpassword)
            .buttonStyle(largeButton() )
        if(error != "") {
            Text(error)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
                .padding()
        }
    }
}


struct loginView : View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var profile: UserProfile?
    @State var pref: preference?
    @EnvironmentObject var session: SessionStore
    
    func login() {
        session.signIn(email: email, password: password) { (profile, pref, error) in
            if let error = error {
                self.error = error.localizedDescription
                print("Error when signing in: \(error)")
            } else {
                self.email = ""
                self.password = ""
                self.profile = profile
                self.pref = pref
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
            Image("UnderDogSBOfficial")
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

struct UpdatePasswordView: View {
    @State var currentPassword: String = ""
    @State var error: String = ""
    @State var email: String = ""
    @State var newPassword: String = ""
    @EnvironmentObject var session: SessionStore
    func changePassword() {
        session.changePassword(email: email, currentPassword: currentPassword, newPassword: newPassword)
            { (error) in
                if let error = error {
                    self.error = error.localizedDescription
                    print("Incorrect Email/Password: \(error)")      }
                else {
                    self.email = ""
                    self.currentPassword = ""
                    self.newPassword = ""
                    
                }}}
        var body: some View{
            VStack(spacing: 30){
            Text("Update Password")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding()
            TextField("Email Address", text: $email).padding(.horizontal)
            TextField("Current Password", text: $currentPassword)
                .padding(.horizontal)
            TextField("New Password", text: $newPassword).padding(.horizontal)
            NavigationLink(
                    destination: resetPasswordView(),
                    label: {
                        Text("Forget password?")
                    })
                    .padding(.horizontal)
                Button(action: changePassword, label: {
                Text("Change Password")
                    .padding()
                if(error != "") {
                        Text("Incorrect Email/Password")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.red)
                            .padding()
                }})
            .buttonStyle(largeButton())
            .frame(maxHeight: .infinity,
              alignment: .top)
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

