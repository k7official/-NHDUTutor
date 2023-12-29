//
//  Tutor.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/27.
//

import Foundation

struct TutorModel: Identifiable {
    var id = UUID()
    var name: String = ""
    var image: String = ""
    var hourlyRates: Int
    var subjectsTaught: [String] 
}
