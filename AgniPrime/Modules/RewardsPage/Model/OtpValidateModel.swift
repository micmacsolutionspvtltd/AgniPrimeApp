//
//  OtpValidateModel.swift
//  AgniPrime
//
//  Created by MAC on 05/04/22.
//

import Foundation



// MARK: - OtpValidateModelElement
struct OtpValidateModelElement: Codable {
    let the0, the1, the2, the3: String
    let the4, the5, the6, the7: String
    let the8, the9, the10, the11: String
    let the12, pID, distributorID, dEnrollmentNo: String
    let pBuyerID, pAmount, pKg, pTon: String
    let pPoints, pStatus, otp, redeemRequest: String
    let cdatetime, udatetime: String

    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case the10 = "10"
        case the11 = "11"
        case the12 = "12"
        case pID = "p_id"
        case distributorID = "distributor_id"
        case dEnrollmentNo = "d_enrollment_no"
        case pBuyerID = "p_buyer_id"
        case pAmount = "p_amount"
        case pKg = "p_kg"
        case pTon = "p_ton"
        case pPoints = "p_points"
        case pStatus = "p_status"
        case otp
        case redeemRequest = "redeem_request"
        case cdatetime, udatetime
    }
}

typealias OtpValidateModel = [OtpValidateModelElement]
