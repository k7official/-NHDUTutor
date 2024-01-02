//
//  LoginView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/22.
//

import SwiftUI

struct LoginView: View {
    
    //@Environment(\.presentationMode) var presentationMode
    @Binding var isAuthenticated: Bool
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float = 0
    //@State private var showingLoginScreen = false
    //@State private var isAuthenticated = false
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $username)
                    .keyboardType(.namePhonePad)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                TextField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                
                Button("Login") {
                    authenticateUser(username: username, password: password)
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
//                NavigationLink(destination: TabView_(), isActive: $showingLoginScreen) {
//                    EmptyView()
//                }
//                if isAuthenticated {
//                    TabView_()
//                }
//                if isAuthenticated {
//                    NavigationLink(
//                        destination: TabView_(),
//                        isActive: $isAuthenticated
//                    ) {
//                        EmptyView()
//                    }
//                    .hidden()
//                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "musa" {
            wrongUsername = 0
            if password.lowercased() == "123" {
                wrongPassword = 0
               // showingLoginScreen = true
                isAuthenticated = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isAuthenticated: .constant(true))
    }
}
