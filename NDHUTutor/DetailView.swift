//
//  DetailView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/27.
//

import SwiftUI

struct DetailView: View {
    @State private var isBookingSheetPresented = false
    var tutor: Tutor
    
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
                Text("Booking here")
            }
        }
        // Add more details as needed

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTutor = Tutor(name: "John Doe", image: "tutor1", hourlyRates: 300, subjectsTaught: ["Math", "Physics"])
        DetailView(tutor: sampleTutor)
    }
}
