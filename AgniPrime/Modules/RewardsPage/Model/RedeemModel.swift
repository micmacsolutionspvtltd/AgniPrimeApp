//
//  RedeemModel.swift
//  AgniPrime
//
//  Created by MAC on 01/04/22.
//

import Foundation

struct RedeemModel: Codable , Hashable{
    let status, reason , quantity: String?

    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable , Hashable{
    let giftPoint: String?
    let giftProducts: [GiftProduct]?

    enum CodingKeys: String, CodingKey {
        case giftPoint = "gift_point"
        case giftProducts = "gift_products"
    }
}

// MARK: - GiftProduct
struct GiftProduct: Codable , Hashable{
    let dppID: String?
    let productName, giftAmt, brandName, productCode: String?
    let productImage, productDES, productMrp, productTax: String?
    let availability, productValue, productKgs, productPoints: String?
    let dppIsActive, dppIsDelete, createdAt: String?
    let updatedAt: String?
    let ton: String?

    enum CodingKeys: String, CodingKey {
        case dppID = "dpp_id"
        case productName = "product_name"
        case giftAmt = "gift_amt"
        case brandName = "brand_name"
        case productCode = "product_code"
        case productImage = "product_image"
        case productDES = "product_des"
        case productMrp = "product_mrp"
        case productTax = "product_tax"
        case availability
        case productValue = "product_value"
        case productKgs = "product_kgs"
        case productPoints = "product_points"
        case dppIsActive = "dpp_is_active"
        case dppIsDelete = "dpp_is_delete"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case ton
    }
}
