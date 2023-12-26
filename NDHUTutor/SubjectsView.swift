//
//  MainPageView.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/27.
//

import SwiftUI

struct SubjectView: View {
    let imageName: String
    let subjectName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .cornerRadius(10)
            Text(subjectName)
        }
        .padding()
    }
}

struct SubjectsView: View {
    let subjects = [
        ("calculus", "Calculus"),
        ("chinese", "Chinese"),
        ("physics", "Physics"),
        ("programming", "Programming"),
        ("discrete", "Discrete maths"),
        ("linear algebra", "Linear algebra")
    ]
    
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: columns, spacing: 10){
                    ForEach(subjects, id: \.0) { subject in
                        SubjectView(imageName: subject.0, subjectName: subject.1)
                    }
                }
            }
            .navigationTitle(Text("Subjects"))
        }
    }
}



struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsView()
    }
}
