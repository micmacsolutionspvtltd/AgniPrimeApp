//
//  RedeemViewMode.swift
//  AgniPrime
//
//  Created by MAC on 01/04/22.
//

import Foundation


import Foundation
import SwiftUI

class RedeemViewModel : ObservableObject{

    @Published var redeemValuesGetData : RedeemModel?
    @Published var redeemPointsBasedValueGetData : RedeemListValuesModel?
  
    //CreditLimit Value Get Api Call
    
    func redeemValuesGetApi(completionHandler : @escaping (_ result : RedeemModel?) -> Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .REWARDSPAGE))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: RedeemModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.redeemValuesGetData = result!
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func redeemListValueGetApi(totalPoints : String , completionHandler : @escaping (_ result: RedeemListValuesModel?)->Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .REWARDPOINTLIST) + totalPoints)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: RedeemListValuesModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
             //   self.redeemPointsBasedValueGetData = result!
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func redeemOtpSendApi(enrollMentNumber : String) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .REDEEMOTPSENDAPI) + enrollMentNumber)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: AddCustomerModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
             //   self.redeemPointsBasedValueGetData = result!
                  //  completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func redeemOtpValidate(redPoints : String,product_id : String, otp : String, enrollmentno :String ,points : String , completionHandler : @escaping(_ result : OtpValidateModel?) -> Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .REDEEMREQUESTOTPVALIDATE) + redPoints + "&product_id=\(product_id)" + "&otp=\(otp)" + "&enrollmentno=\(enrollmentno)" + "&points=\(points)")
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: OtpValidateModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
             //   self.redeemPointsBasedValueGetData = result!
                    completionHandler(result!)
            }else{
                completionHandler(nil)
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    
}
