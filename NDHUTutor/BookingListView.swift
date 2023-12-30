//
//  BookingListView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/30.
//

import SwiftUI
import CoreData

struct BookingListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Booking.date, ascending: true)],
        animation: .default)
    private var bookings: FetchedResults<Booking>
    @State private var selectedBooking: Booking?
    @State var showConfirm = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bookings) { booking in
                    NavigationLink(destination: BookingDetailView(booking: booking)) {
                        VStack(alignment: .leading) {
                            Text("Subject: \(booking.subject ?? "Unknown Subject")")
                            Text("Date: \(booking.date?.description ?? "Unknown Date")")
                            // Add more details as needed
                        }
                    }
                }
                .onDelete { indexSet in
                    if let firstIndex = indexSet.first {
                        selectedBooking = bookings[firstIndex]
                        showConfirm = true
                    }
                }
                .actionSheet(isPresented: $showConfirm) {
                    ActionSheet(
                        title: Text("Confirm Deletion"),
                        message: Text("Are you sure you want to delete this booking?"),
                        buttons: [
                            .destructive(Text("Delete"), action: {
                                deleteBooking()
                            }),
                            .cancel()
                        ]
                    )
                }
            }
            .navigationTitle("Bookings")
        }
    }
    
    private func deleteBooking() {
        if let bookingToDelete = selectedBooking {
            withAnimation {
                viewContext.delete(bookingToDelete)
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }
}

struct BookingDetailView: View {
    var booking: Booking
    
    var body: some View {
        VStack {
            Text("Booking Details")
                .font(.title)
            
            Text("Tutor: \(booking.tutor ?? "Unknown Subject")")
            Text("Subject: \(booking.subject ?? "Unknown Subject")")
            Text("Date: \(booking.date?.description ?? "Unknown Date")")
            Text("Time: \(booking.time ?? "Unknown Subject")")
            // Add more details as needed
        }
        .padding()
    }
}


struct BookingListView_Previews: PreviewProvider {
    static var previews: some View {
        BookingListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
