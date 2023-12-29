//
//  Persistence.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/29.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController() // static property that is initiated once
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext { container.viewContext } // involve operation methods
    
    init() {
        container = NSPersistentContainer(name: "NDHUTutor")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error { print(error) } })
    }
    
    // A convenience method to save the managed object context
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - Booking Data Operations
    
    // Add a new booking
    func addBooking(tutor: String, date: Date, subject: String, time: String
    ) {
        let context = container.viewContext
        let newBooking = Booking(context: context)
        newBooking.tutor = tutor
        newBooking.date = date
        newBooking.subject = subject
        newBooking.time = time
        
        saveContext()
    }
    
    // Fetch all bookings
    func fetchAllBookings() -> [Booking] {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<Booking> = Booking.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetching bookings: \(error.localizedDescription)")
            return []
        }
    }
    
    // Update a booking
    func updateBooking(_ booking: Booking, newDate: Date, newSubject: String, newTime: String) {
        booking.date = newDate
        booking.subject = newSubject
        booking.time = newTime
        
        saveContext()
    }
    
    // Delete a booking
    func deleteBooking(_ booking: Booking) {
        let context = container.viewContext
        context.delete(booking)
        
        saveContext()
    }
}
