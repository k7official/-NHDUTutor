//
//  TutorsView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/27.
//

import SwiftUI

struct TutorView: View {
    let tutor: TutorModel
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared

    var body: some View {
        VStack {
            Image(tutor.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(10)

            Text(tutor.name)
                .font(.headline)

            Text("Hourly Rates: $\(String(format: "%.2f", tutor.hourlyRates))")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct TutorsView: View {
    var tutors: [TutorModel] = [
        TutorModel(id: UUID(), name: "John Doe", image: "tutor1", hourlyRates: 300, subjectsTaught: ["Calculus", "Discrete maths"]),
        TutorModel(id: UUID(), name: "Jane Doe", image: "tutor3", hourlyRates: 350, subjectsTaught: ["Physics", "Chinese"])
        // Add more tutors as needed
    ]
    
    var subjects = ["All", "Calculus", "Chinese", "Physics", "Programming", "Discrete maths", "Linear algebra"]
    
    @State var filterText = "All"
    
    var filteredTutors: [TutorModel] {
        if filterText.isEmpty {
            return tutors
        } else {
            return tutors.filter { $0.subjectsTaught.contains(filterText) || filterText == "All" }
        }
    }

    var columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(subjects, id: \.self) { subject in
                            Button(action: {
                                self.filterText = subject
                            }) {
                                Text(subject)
                                    .padding()
                                    .foregroundColor(self.filterText == subject ? .white : .black)
                                    .background(self.filterText == subject ? Color.blue : Color.gray)
                                    //.cornerRadius(8)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(filteredTutors, id: \.id) { tutor in
                            NavigationLink(destination: DetailView(persistenceController: PersistenceController.shared, tutor: tutor)) {
                                TutorView(tutor: tutor)
                            }
                        }
                    }
                }
                .navigationTitle("Tutors")
            }
        }
    }
}

struct TutorsView_Previews: PreviewProvider {
    static var previews: some View {
        TutorsView()
    }
}
