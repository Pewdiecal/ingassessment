//
//  People.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import Foundation

struct People: Codable, Identifiable {
    var id = UUID()
    var avatar: String?
    var name: String?
    var phone: String?
    var isActive: Bool?
    var index: Int?
    var emailAddress: String?
    var description: String?

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {
        case avatar
        case name
        case phone
        case isActive
        case index
        case emailAddress
        case description
    }
}
