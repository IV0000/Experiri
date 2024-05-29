//
//  Experience.swift
//  Experiri
//
//  Created by Ivan Voloshchuk on 29/05/24.
//

import Foundation
import SwiftData

@Model
final class Experience {
    var title: String
    var detail: String
    var rating: Int
    var timestamp: Date

    @Relationship
    var category: ExperienceCategory

    init(title: String, detail: String, rating: Int, timestamp: Date, category: ExperienceCategory) {
        self.title = title
        self.detail = detail
        self.rating = rating
        self.timestamp = timestamp
        self.category = category
    }
}

@Model
final class ExperienceCategory {
    var name: String
    var hexColor: UInt

    @Relationship
    var experiences: [Experience]

    init(name: String, hexColor: UInt, experiences: [Experience] = []) {
        self.name = name
        self.hexColor = hexColor
        self.experiences = experiences
    }
}
