//
//  RedeemListValueModel.swift
//  AgniPrime
//
//  Created by MAC on 05/04/22.
//

import Foundation


struct RedeemListValuesModel: Codable , Hashable{
    let status, reason: String?
    let productData: [ProductDatum]?

    enum CodingKeys: String, CodingKey {
        case status, reason
        case productData = "product_data"
    }
}

// MARK: - ProductDatum
struct ProductDatum: Codable,Hashable {
    let dppID, productName, cumGiftPoint, brandName: String?
    let productCode, productImage, productMrp, productTax: String?
    let availability, productPoints, dppIsActive: String?

    enum CodingKeys: String, CodingKey {
        case dppID = "dpp_id"
        case productName = "product_name"
        case cumGiftPoint = "cum_gift_point"
        case brandName = "brand_name"
        case productCode = "product_code"
        case productImage = "product_image"
        case productMrp = "product_mrp"
        case productTax = "product_tax"
        case availability
        case productPoints = "product_points"
        case dppIsActive = "dpp_is_active"
    }
}
