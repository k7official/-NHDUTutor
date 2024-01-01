//
//  TabView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2024/1/1.
//

import SwiftUI
import CoreData

struct TabView_: View {
    var body: some View {
        TabView {
            SubjectsView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Subjects")
                }
            
            TutorsView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Tutors")
                }
            
            BookingListView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Bookings")
                }
            
            // Add more views as needed
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView_()
    }
}
