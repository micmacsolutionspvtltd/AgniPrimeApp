//
//  SalesViewModel.swift
//  AgniPrime
//
//  Created by MAC on 01/04/22.
//

import Foundation

class SalesViewModel : ObservableObject{
    
    
    @Published var isClicked = false
    @Published var salesValueGetData : [SalesModelElement]? = []
    
  
    //CreditLimit Value Get Api Call
    
    func salesValueGetApi(completionHandler : @escaping (_ result : SalesModel?)->Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .SALESVALUEGETAPI) + (StorageManager.sharedInstance.getDitributorId() ?? ""))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: SalesModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
              //  self.salesValueGetData = result!
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func enrollmentNumberGetApi(enrollMentNumber : String)  {
        let params : [String : Any]? = nil
        let urlRequest = (APIList().getUrlString(url : .ENROLLMENTNUMBER))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: SalesModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.salesValueGetData = result!
                   // completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
    }
    
    func productSalesApi(enrollMentNumber : String, kg : String ,did : String ,remarks : String, amount: String ,ton :  String , completionHandler : @escaping (_ result: SalesOrderModel?)->Void) {
        let params : [String : Any]? = nil
        let urlRequest = (APIList().getUrlString(url : .PRODUCTSALE) + "enrollment_no=\(enrollMentNumber)" + "&d_id=\(did)" + "&d_o_remarks=\(remarks)" + "&d_o_amt=\(amount)" + "&d_o_ton=\(ton)" + "&d_o_kg=\(kg)")
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: SalesOrderModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
              //  self.salesValueGetData = result!
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
    }
}
