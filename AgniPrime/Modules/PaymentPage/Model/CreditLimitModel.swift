//
//  CreditLimitModel.swift
//  AgniPrime
//
//  Created by MAC on 31/03/22.
//

import Foundation


// MARK: - CreditLimitModelElement
struct CreditLimitModelElement: Codable,Hashable {
    let invID, distID, distName, distAliasNo: String?
    let orderID, invDate, invNo, paidAmt: String?
    let openAmt, outAmt, creditDays, creditLimit: String?
    let cStatus, cCdate, remainDays: String?

    enum CodingKeys: String, CodingKey {
        case invID = "inv_id"
        case distID = "dist_id"
        case distName = "dist_name"
        case distAliasNo = "dist_alias_no"
        case orderID = "order_id"
        case invDate = "inv_date"
        case invNo = "inv_no"
        case paidAmt = "paid_amt"
        case openAmt = "open_amt"
        case outAmt = "out_amt"
        case creditDays = "credit_days"
        case creditLimit = "credit_limit"
        case cStatus = "c_status"
        case cCdate = "c_cdate"
        case remainDays
    }
}

typealias CreditLimitModel = [CreditLimitModelElement]
