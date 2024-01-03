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
            
            CircleImage(image: tutor.image)

            Text(tutor.name)
                .font(.headline)

            Text("Hourly Rates: $\(String(format: "%.2f", tutor.hourlyRates))")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
       
    }
}

struct TutorsView: View {
    var tutors: [TutorModel] = [
        TutorModel(id: UUID(), name: "Denton Cannon", image: "tutor5", hourlyRates: 300, subjectsTaught: ["Calculus", "Discrete maths"]),
        TutorModel(id: UUID(), name: "Minerva Ingram", image: "tutor6", hourlyRates: 350, subjectsTaught: ["Physics", "Chinese"])
        // Add more tutors as needed
    ]
    
    var subjects = ["All", "Calculus", "Chinese", "Physics", "Programming", "Discrete maths", "Linear algebra"]
    
    @State var filterText = "All"
    @State private var searchText = ""
    
    var filteredTutors: [TutorModel] {
        if searchText.isEmpty {
            return tutors.filter { $0.subjectsTaught.contains(filterText) || filterText == "All" }
        } else {
            return tutors.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }

    var columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]

    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Search Tutors", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: searchText) { newValue in
                        // Optionally perform additional actions when the search text changes
                    }
                
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
                    if filteredTutors.isEmpty {
                        Text("No tutors available for \(filterText)")
                            .foregroundColor(.red)
                            .font(.system(size: 40))
                            .padding()
                    } else {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(filteredTutors, id: \.id) { tutor in
                                NavigationLink(destination: DetailView(persistenceController: PersistenceController.shared, tutor: tutor)) {
                                    TutorView(tutor: tutor)
                                }
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
