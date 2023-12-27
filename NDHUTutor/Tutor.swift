//
//  Tutor.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/27.
//

import Foundation

struct Tutor: Identifiable {
    var id = UUID()
    var name: String = ""
    var image: String = ""
    var hourlyRates: Int
    var subjectsTaught: [String] 
}
