import Foundation
import SwiftUI
import Firebase
import UIKit
import FirebaseDatabase

struct ContactSupportView: View {
    @EnvironmentObject var session: SessionStore
    @State var email: String = ""
    @State var helpticket: String = ""
    var ref: DatabaseReference!
    func addTicket(email: String, helpticket: String){
        self.ref.child("Help Ticket").setValue(["helpticket": helpticket])
        }
    
        var body: some View {
        VStack(alignment: .leading, spacing:20){
            TextField("Email Address", text: $email)
                .padding()
            TextField("Issue", text: $helpticket).padding()
            }
            
        }
}


struct SportsBetting101View: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
        ScrollView(.horizontal){
            HStack {
                Group{
                    Image("TutSpread").padding()
                    Image("TutSpread2").padding()
                    Image("TutSpread2").padding().animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    Image("TutSpread3").padding().animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    Image("TutWinner").padding().animation(.easeIn)
                    Image("TutWinner2").padding().animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    Image("TutWinner3").padding().animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    Image("TutTP").padding().animation(.easeIn)
                        Image("TutTP2").padding().animation(.easeIn)
                        Image("TutTP3").padding().animation(.easeIn)
                    }
                Image("TutPNSign").padding()
                    Image("TutPNSign2").padding().animation(.easeIn)
                                }
                            }
                        }
                }
                
        
    


struct DarkModeView: View {
    @EnvironmentObject var session: SessionStore
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View{
        VStack(alignment: .leading){
            Toggle(isOn: $isDarkMode, label: {
                Text("Dark Mode")
            }).padding()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
       // .environment(\.colorScheme,  isDarkMode ? .dark : .light)
        .accentColor(.primary)
            
        }
}

/* Tapping Method

struct SportsBetTutSpread2: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
        VStack{
            NavigationLink(destination: SportsBetTutSpread3().navigationBarBackButtonHidden(true)){Image("TutSpread2")}
            }
    }
}

struct SportsBetTutSpread3: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
        VStack{
            NavigationLink(destination: SportsBetTutWin().navigationBarBackButtonHidden(true)) {Image("TutSpread3")}
            }
    }
}

struct SportsBetTutWin: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsBetTutWin2().navigationBarBackButtonHidden(true)) {Image("TutWinner")}
                }
        }
}

struct SportsBetTutWin2: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsBetTutWin3().navigationBarBackButtonHidden(true)){Image("TutWinner2")}
                }
        }
}

struct SportsBetTutWin3: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsBetTutTP().navigationBarBackButtonHidden(true)) {Image("TutWinner3")}
                }
        }
    }

struct SportsBetTutTP: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsBetTutTP2().navigationBarBackButtonHidden(true)) {Image("TutTP")}
                }
        }
}

struct SportsBetTutTP2: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsBetTutTP3().navigationBarBackButtonHidden(true)) {Image("TutTP2")}
                }
        }
}

struct SportsBetTutTP3: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsPNSign().navigationBarBackButtonHidden(true)) {Image("TutTP3")}
                }
        }
}

struct SportsPNSign: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
            VStack{
                NavigationLink(destination: SportsPNSign2().navigationBarBackButtonHidden(true)) {Image("TutPNSign")}
                }
        }
}

struct SportsPNSign2: View {
    @EnvironmentObject var session: SessionStore
    var body: some View{
                Image("TutPNSign2")
        }
    }
*/
