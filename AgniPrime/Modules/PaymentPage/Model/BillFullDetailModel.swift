//
//  BillFullDetailModel.swift
//  AgniPrime
//
//  Created by MAC on 01/04/22.
//

import Foundation

struct BillFullDetailsModelElement: Codable, Hashable , Identifiable{
    
    let id, partyName, partyAlias, billNo: String
    let vchType, vchNo, date, amount: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, partyName, partyAlias, billNo, vchType, vchNo, date, amount
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

typealias BillFullDetailsModel = [BillFullDetailsModelElement]
