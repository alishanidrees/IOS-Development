//
//  HomeResponse.swift
//  IOSecondProject
//
//  Created by Ali Shan on 23/11/2023.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeResponse = try? JSONDecoder().decode(HomeResponse.self, from: jsonData)

import Foundation

// MARK: - DataClass
struct HomeResponse: Codable {
    let partners: [Partner]?
    let reviews: [Review]?
    let unreadNotificationsCount: Int?
}

// MARK: - Partner
struct Partner: Codable {
    let id, name, identifier, type: String?
    let description: String?
    let image, bannerImage: String?
    let termsAndConditions, userID: String?
    let totalNoOfReviews: Int?
    let averageRating: Double?
    let locations: [Location]?

    enum CodingKeys: String, CodingKey {
        case id, name, identifier, type, description, image, bannerImage, termsAndConditions
        case userID = "userId"
        case totalNoOfReviews, averageRating, locations
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let latitude, longitude: Double?
    let locationCode, address: String?
}

// MARK: - Review
struct Review: Codable {
    let id, partnerID, partnerName: String?
    let partnerImage: String?
    let userID: String?
    let value: Int?
    let comment: String?
    let timeStamp: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case partnerID = "partnerId"
        case partnerName, partnerImage
        case userID = "userId"
        case value, comment, timeStamp
    }
}
