//
//  OtpModel.swift
//  AgniPrime
//
//  Created by MAC on 31/03/22.
//

import Foundation

struct OtpModel: Codable {
    let id, doctorName, activeStatus, contactName: String?
    let alies, loginName, loginPassword, clientType: String?
    let dob, anniversary, docGender, repAssign: String?
    let chemistID, repID, docSpecilistID, docQualification: String?
    let patientpervisit, docCategory, docPatientType, docYrPractice: String?
    let docPracticeLOC, docPracticePday, docPincode, docCurrentLOC: String?
    let docClassification, docLOCAddress, drLatitude, drLongitude: String?
    let docSpecific, timeSpecific, visitpermonth, docRegisNo: String?
    let doctorAddrs, docDistrictID, docAreaID, docPinID: String?
    let docContactNo, email, docHospitalClinicName, docStatus: String?
    let cTime, cDate, approvedby, managerlat: String?
    let managerlong, managerapprovestatus, areanameee, prescriber: String?
    let applyforedit, onetimeallowforrep, repiddelete, visitintervaltovisit: String?
    let stationtype, visitcardclinicphoto, favourite, plottingopentwotimes: String?
    let stateID, stateName, divisionID, cliOpeningday: String?
    let lanline, emailidd, docshirtsize, doctrousersize: String?
    let docshoesize, mobilebrandname, lapbrandname, docInterestarea: String?
    let docHobby, docFrd, hosclinicname, noofbuds: String?
    let ownpharmacy, memberdoc, cardoc, dremailid: String?
    let website, drorchemist, core, corebrand: String?
    let regino, exsnew, approveddr, loctionplotApproval: String?
    let referencedrid, updatedAt, loginID, password: String?
    let mobile, otp, creditLimit, paidAmt: String?
    let outAmt, creditDays, invNo, invDate: String?
    let orderID, gstNo: String?
    let balanceAmt: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case doctorName = "doctor_name"
        case activeStatus = "active_status"
        case contactName = "contact_name"
        case alies
        case loginName = "login_name"
        case loginPassword = "login_password"
        case clientType = "client_type"
        case dob, anniversary
        case docGender = "doc_gender"
        case repAssign = "rep_assign"
        case chemistID = "chemist_id"
        case repID = "rep_id"
        case docSpecilistID = "doc_specilist_id"
        case docQualification = "doc_qualification"
        case patientpervisit
        case docCategory = "doc_category"
        case docPatientType = "doc_patient_type"
        case docYrPractice = "doc_yr_practice"
        case docPracticeLOC = "doc_practice_loc"
        case docPracticePday = "doc_practice_pday"
        case docPincode = "doc_pincode"
        case docCurrentLOC = "doc_current_loc"
        case docClassification = "doc_classification"
        case docLOCAddress = "doc_loc_address"
        case drLatitude = "dr_latitude"
        case drLongitude = "dr_longitude"
        case docSpecific = "doc_specific"
        case timeSpecific = "time_specific"
        case visitpermonth
        case docRegisNo = "doc_regis_no"
        case doctorAddrs = "doctor_addrs"
        case docDistrictID = "doc_district_id"
        case docAreaID = "doc_area_id"
        case docPinID = "doc_pin_id"
        case docContactNo = "doc_contact_no"
        case email
        case docHospitalClinicName = "doc_hospital_clinic_name"
        case docStatus = "doc_status"
        case cTime = "c_time"
        case cDate = "c_date"
        case approvedby, managerlat, managerlong, managerapprovestatus, areanameee, prescriber, applyforedit, onetimeallowforrep, repiddelete, visitintervaltovisit, stationtype, visitcardclinicphoto, favourite, plottingopentwotimes
        case stateID = "state_id"
        case stateName = "state_name"
        case divisionID = "division_id"
        case cliOpeningday = "cli_openingday"
        case lanline, emailidd, docshirtsize, doctrousersize, docshoesize, mobilebrandname, lapbrandname
        case docInterestarea = "doc_interestarea"
        case docHobby = "doc_hobby"
        case docFrd = "doc_frd"
        case hosclinicname, noofbuds, ownpharmacy, memberdoc, cardoc, dremailid, website, drorchemist, core, corebrand, regino, exsnew, approveddr
        case loctionplotApproval = "loctionplot_approval"
        case referencedrid
        case updatedAt = "updated_at"
        case loginID = "login_id"
        case password, mobile, otp
        case creditLimit = "credit_limit"
        case paidAmt = "paid_amt"
        case outAmt = "out_amt"
        case creditDays = "credit_days"
        case invNo = "inv_no"
        case invDate = "inv_date"
        case orderID = "order_id"
        case gstNo = "gst_no"
        case balanceAmt
    }
}


typealias OtpValueModel = [OtpModel]
