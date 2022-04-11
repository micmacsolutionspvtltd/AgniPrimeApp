//
//  CreditLimitViewModel.swift
//  AgniPrime
//
//  Created by MAC on 31/03/22.
//

import Foundation

class CreditLimitViewModel: ObservableObject{

    @Published var creditLimiGetData : [CreditLimitModelElement]? = []
    @Published var billDetailsDatas : BillingDetailModel?
    @Published var particularBillDatas: [BillFullDetailsModelElement]? = []
    //CreditLimit Value Get Api Call
    
    func creditLimitValueGetApi() {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .CREDITLIMIT) + (StorageManager.sharedInstance.getAliedId() ?? ""))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: CreditLimitModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.creditLimiGetData = result!
                   // completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func distributorBillingDetailsGetApi() {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .BILLDETAILS) + (StorageManager.sharedInstance.getAliedId() ?? ""))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: BillingDetailModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.billDetailsDatas = result!
                   // completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func particularBillDataGetApi(billNo : String, completionHandler:@escaping(_ result: BillFullDetailsModel?)->Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .PARTICULARBILLVALUE) + billNo)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: BillFullDetailsModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.particularBillDatas = result!
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
}
