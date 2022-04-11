//
//  CustomerMode.swift
//  AgniPrime
//
//  Created by MAC on 02/04/22.
//

import Foundation

struct CustomerModelElement: Codable , Hashable {
    let dID, dDealerID, dEnrollmentNo, dType: String?
    let dName, dMobile, otp, dob: String?
    let anniversaryDate, redeemRequest, dAddress, dArea: String?
    let dDoorno, dCity, dState, dPincode: String?
    let dAadharNo, dStatus, dApprove, dDateTime: String?

    enum CodingKeys: String, CodingKey {
        case dID = "d_id"
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



typealias CustomerModel = [CustomerModelElement]



// MARK: - AddCustomerModel

struct AddCustomerModel: Codable {
    let status, msg: String?
}

