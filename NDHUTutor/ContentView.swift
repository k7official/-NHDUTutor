//
//  ContentView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingLoginScreen = false
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Image("ndhu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    //.opacity(0.2)
                    .shadow(radius: 30)
                Text("NDHUTutor")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(Color("color1"))
                
                Button("Login"){
                    showingLoginScreen = true
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color("color1"))
                .cornerRadius(10)
                
                Button("Register"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color("color1"))
                .cornerRadius(10)
                
                NavigationLink(destination: LoginView(isAuthenticated: $isAuthenticated), isActive: $showingLoginScreen) {
                }
            }
            .padding()
//            .background(
//                Color
//            )
        }
        .navigationBarHidden(true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isAuthenticated: .constant(false))
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Use a State variable to simulate binding
//        struct PreviewContainer: View {
//            @Binding var isAuthenticated: Bool
//
//            var body: some View {
//                NavigationView {
//                    ContentView(isAuthenticated: $isAuthenticated)
//                }
//            }
//        }
//
//        return PreviewContainer()
//    }
//}

