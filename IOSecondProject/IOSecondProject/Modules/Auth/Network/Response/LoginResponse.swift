//
//  LoginResponse.swift
//  IOSecondProject
//
//  Created by Ali Shan on 20/11/2023.
//

import Foundation

// MARK: - DataClass
struct User: Codable {
    let id, email, accessToken, refreshToken: String?
    let name, phoneCode, phoneNumber: String?
    let dateOfBirth: Int?
    let nationality: String?
    let otpRequired: Bool?
    let loyaltyID: String?
    let pointBalance, totalPointsEarned, totalPointsRedeemed: Int?
    let profileImage:String?
    let isVerified, isSubscribed: Bool?
    let userLocale: String?

    enum CodingKeys: String, CodingKey {
        case id, email, accessToken, refreshToken, name, phoneCode, phoneNumber, dateOfBirth, nationality, otpRequired
        case loyaltyID = "loyaltyId"
        case pointBalance, totalPointsEarned, totalPointsRedeemed, profileImage, isVerified, isSubscribed, userLocale
    }
}

