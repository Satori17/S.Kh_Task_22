//
//  GuestModel.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import Foundation


//MARK: - GuestModel
struct GuestModel: Codable {
    let success: Bool?
    let guestSessionID, expiresAt: String?

    enum CodingKeys: String, CodingKey {
        case success
        case guestSessionID = "guest_session_id"
        case expiresAt = "expires_at"
    }
}

//MARK: - Rating Response
struct RatingResponse: Codable {
    let statusCode: Int?
    let statusMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
    
}
