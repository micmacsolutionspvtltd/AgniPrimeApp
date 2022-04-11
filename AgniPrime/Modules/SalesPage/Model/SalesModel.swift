//
//  SalesModel.swift
//  AgniPrime
//
//  Created by MAC on 01/04/22.
//

import Foundation

struct SalesModelElement: Codable , Hashable {
    let totalpoints : String?
    let dID, dDealerID, dEnrollmentNo: String?
    let dType, dName, dMobile, otp: String?
    let dob, anniversaryDate, redeemRequest, dAddress: String?
    let dArea, dDoorno, dCity, dState: String?
    let dPincode, dAadharNo, dStatus, dApprove: String?
    let dDateTime: String?

    enum CodingKeys: String, CodingKey {
        case dID = "d_id"
        case totalpoints
        case dDealerID = "d_dealer_id"
        case dEnrollmentNo = "d_enrollment_no"
        case dType = "d_type"
        case dName = "d_name"
        case dMobile = "d_mobile"
        case otp, dob
        case anniversaryDate = "anniversary_date"
        case redeemRequest = "redeem_request"
        case dAddress = "d_address"
        case dArea = "d_area"
        case dDoorno = "d_doorno"
        case dCity = "d_city"
        case dState = "d_state"
        case dPincode = "d_pincode"
        case dAadharNo = "d_aadhar_no"
        case dStatus = "d_status"
        case dApprove = "d_approve"
        case dDateTime = "d_date_time"
    }
}




typealias SalesModel = [SalesModelElement]
