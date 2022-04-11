//
//  ViewBirthdayModel.swift
//  AgniPrime
//
//  Created by MAC on 04/04/22.
//

import Foundation


struct ViewBirthdayModelElement: Codable , Hashable {
    let id, docID, name, mobileNo: String?
    let relation, birthday, status, cDatetime: String?

    enum CodingKeys: String, CodingKey {
        case id
        case docID = "doc_id"
        case name
        case mobileNo = "mobile_no"
        case relation, birthday, status
        case cDatetime = "c_datetime"
    }
}

typealias ViewBirthdayModel = [ViewBirthdayModelElement]
