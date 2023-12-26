//
//  ContentView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("NDHUTutor")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                
                Button("Login"){
                    showingLoginScreen = true
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                Button("Register"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                NavigationLink(destination: LoginView(), isActive: $showingLoginScreen) {
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
