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

