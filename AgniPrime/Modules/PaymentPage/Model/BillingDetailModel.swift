//
//  BillingDetailModel.swift
//  AgniPrime
//
//  Created by MAC on 01/04/22.
//

import Foundation

struct BillingDetailModel: Codable {
    let distributorAlies, pendingBillsAmt: String?
    let lessThan10_DaysPendingAmt, bw10_20_PendingAmt, bw20_30_PendingAmt: Int?
    let greaterThan30_DaysPendingAmt: String?

    enum CodingKeys: String, CodingKey {
        case distributorAlies = "distributor_alies"
        case pendingBillsAmt = "pending_bills_amt"
        case lessThan10_DaysPendingAmt = "less_than_10_days_pending_amt"
        case bw10_20_PendingAmt = "bw_10_20_pending_amt"
        case bw20_30_PendingAmt = "bw_20_30_pending_amt"
        case greaterThan30_DaysPendingAmt = "greater_than_30_days_pending_amt"
    }
}
