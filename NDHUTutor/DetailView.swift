//
//  DetailView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/27.
//

import SwiftUI

struct DetailView: View {
    @State private var isBookingSheetPresented = false
    var tutor: TutorModel
    
    var body: some View {
        VStack {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Tutor Image
                    Image(tutor.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                    
                    // Tutor Name
                    Text(tutor.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    // Hourly Rates
                    Text("Hourly Rates: $\(tutor.hourlyRates)")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    // Subjects Taught
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Subjects Taught")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ForEach(tutor.subjectsTaught, id: \.self) { subject in
                            Text(subject)
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                        }
                    }
                    
                }
                .navigationBarTitle(tutor.name, displayMode: .inline)
            }
            
            Spacer()
            Button(action: {
                isBookingSheetPresented.toggle()
            }) {
                Text("Book Tutor")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .sheet(isPresented: $isBookingSheetPresented) {
                BookingSheetView(tutor: tutor, isBookingSheetPresented: $isBookingSheetPresented)
            }
        }
        // Add more details as needed
        
    }
}

struct BookingSheetView: View {
    var tutor: TutorModel
    @Binding var isBookingSheetPresented: Bool
    @State private var selectedSubjectIndex = 0
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var selectedTimeIndex = 0
    
    var subjects: [String] {
        tutor.subjectsTaught
    }
    
    var timeSlots: [String] {
        ["10:00 AM", "02:00 PM", "04:00 PM", "06:00 PM"]
    }
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
        
                Text("Make a Booking")
                    .font(.title)
                    .bold()
                    .padding()
                Text("\(tutor.name)")
                    .padding(.leading)
                Form {
                    
                    // Subject Picker
                    Section {
                        Picker("Select Subject", selection: $selectedSubjectIndex) {
                            ForEach(0..<subjects.count, id: \.self) {
                                Text(subjects[$0])
                            }
                        }
                    }
                    
                    // Date Picker
                    DatePicker("Select Date", selection: $selectedDate, in: Date()..., displayedComponents: [.date])
                    //.padding()
                        .datePickerStyle(.graphical)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<timeSlots.count, id: \.self) { index in
                                Button(action: {
                                    selectedTimeIndex = index
                                }) {
                                    Text(timeSlots[index])
                                        .padding()
                                        .foregroundColor(selectedTimeIndex == index ? .white : .blue)
                                        .background(selectedTimeIndex == index ? Color.blue : Color.clear)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    Button("Confirm") {
                        // Handle the booking action with the selected subject, date, and time
                        print("Booking: Subject - \(subjects[selectedSubjectIndex]), Date - \(selectedDate), Time - \(selectedTime)")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        isBookingSheetPresented.toggle()
                        // dismiss the view
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTutor = TutorModel(name: "John Doe", image: "tutor1", hourlyRates: 300, subjectsTaught: ["Math", "Physics"])
        DetailView(tutor: sampleTutor)
    }
}
