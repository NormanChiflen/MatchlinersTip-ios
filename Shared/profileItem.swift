import Foundation
import SwiftUI
import Firebase
import UIKit
import FirebaseDatabase

struct SportsBetting101View: View {
    @EnvironmentObject var session: SessionStore
    @State var numberOfTut = 12
    var body: some View{
        TabView{
            ForEach(1..<numberOfTut) {   num in
                Image("tut\(num)")
                    .resizable()
                    .scaledToFit()
                    .tag(num)
            }
        }.tabViewStyle(PageTabViewStyle())
        .padding()
    }
}
                
// Edit to Add as CheckBox
struct SportsBettingYNView: View{
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack(spacing: 30){
        Text("Would you like a quick introduction to sports betting ?")
            .padding()
        NavigationLink(destination: SportsBetting101View()) {Text( "Yes")}
            .buttonStyle(largeButton())
        NavigationLink(destination: LoggedInView()) {Text("Skip")}
        } .font(.system(size: 20, weight: .bold, design: .rounded))
        .frame(maxHeight: .infinity,
          alignment: .top)
    }
}

struct ContactSupportView: View {
    @EnvironmentObject var session: SessionStore
    @State var email: String = ""
    @State var issue: String = ""
    @State var profile: HelpTicket?
    @State var error: String = ""
    @State var showDetails = false
    /*func createHelpTicket() {
        session.createHelpTicket(email: email, issue: issue) { (profile,error) in
                if let error = error {
                    self.error = error.localizedDescription
                } else {
                    self.profile = profile
                    print(profile!)
                    self.email = ""
                    self.issue = ""
                }
            }
        }*/
        var body: some View {
        VStack(spacing:30){
            Text("Contact Support")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding()
            TextField("Email Address", text: $email)
                .padding()
            TextField("Issue", text: $issue).padding()
            Button(action: {self.showDetails.toggle()})  {
            Text("Submit Issue")
            }.padding()
            .frame(maxHeight: .infinity,
              alignment: .top)
            .buttonStyle(largeButton())
            if showDetails{
                Text("Your Request has been submitted").padding()
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

