//
//  CustomerViewModel.swift
//  AgniPrime
//
//  Created by MAC on 02/04/22.
//

import Foundation


class CustomerViewModel : ObservableObject{

    @Published var showPopIpValue = false
    @Published var customerValueGetData : [CustomerModelElement]? = []
    @Published var viewBirthdayModelDataGet : [ViewBirthdayModelElement]? = []
    @Published var stockQuantityDataGet : RedeemModel?
  
    //CreditLimit Value Get Api Call
    
    func customerValueGetApi() {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .CUSTOMERPAGE) + (StorageManager.sharedInstance.getDitributorId() ?? ""))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: CustomerModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.customerValueGetData = result!
                   // completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func stockQuatityGetApi() {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .STOCKQUANTITYGET) + (StorageManager.sharedInstance.getDitributorId() ?? ""))
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: RedeemModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.stockQuantityDataGet = result!
              //  self.customerValueGetData = result!
                   // completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
 //   "http://sep1.seppro.net/Agnisteelandroid/mapbuyertodistributor_1.php?distributor_id=7&enrollment_no=220323125556"
    func enrollmentNumberGetApi(enrollMentNumber : String) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .ENROLLMENTNUMBER)+enrollMentNumber)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: CustomerModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.customerValueGetData = result!
                   // completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
   
    func addThisCustomerApi(enrollMentNumber : String , completionHandler : @escaping (_ result : AddCustomerModel?) -> Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .ADDCUSTOMERENROLLMENT)+(StorageManager.sharedInstance.getDitributorId() ?? "") + "&enrollment_no=\(enrollMentNumber)" )
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: AddCustomerModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
              //  self.customerValueGetData = result!
                completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func getViewBirthdayApi(docId : String , completionHandler :  @escaping (_ result: ViewBirthdayModel?)->Void){
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .VIEWBIRTHDAY)+docId)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: ViewBirthdayModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
              //  self.viewBirthdayModelDataGet = result!
                  completionHandler(result!)
            }else{
              
            }
            }
        }
        
    }
    func addNewCustomerApi(name : String,mobileNumber: String ,adhaarNumber : String , doorNo : String , streetName : String,areaName : String , cityName : String , stateName : String ,pincode : String , chooseAnniversary : String ,chooseBirthday : String , email : String ,chooseType : String, completionHandler : @escaping(_ result : AddCustomerModel?) -> Void ) {
        var params : [String : String]? = nil
//        params = ["d_dealer_id" :(StorageManager.sharedInstance.getDitributorId() ?? ""),
//                  "d_type" : chooseType,
//                  "d_name" :name,
//                  "d_mobile" : mobileNumber,
//                  "d_address": email,
//                  "dob" :chooseBirthday,
//                  "anniversary_date" : chooseAnniversary,
//                  "d_area" : areaName,
//                  "d_city" : cityName,
//                  "d_state" : stateName ,
//                  "d_pincode": pincode ,
//                  "d_doorno" : doorNo ,
//                  "d_aadhar_no" : adhaarNumber,
//        ]
        let urlRequest = (APIList().getUrlString(url : .ADDNEWCUSTOMER) + "d_dealer_id=\(StorageManager.sharedInstance.getDitributorId() ?? "")&d_type=\(chooseType)&d_name=\(name)&d_mobile=\(mobileNumber)&d_address=\(email)&dob=\(chooseBirthday)&anniversary_date=\(chooseAnniversary)&d_area=\(areaName)&d_city=\(cityName)&d_state=\(stateName)&d_pincode=\(pincode)&d_doorno=\(doorNo)&d_aadhar_no=\(adhaarNumber)" )
      //  let urlRequest = "http://sep1.seppro.net/Agnisteelandroid/insertbydistributor_1.php?d_dealer_id=339&d_type=Mason&d_name=test&d_mobile=78979860911&d_address=kamaraj@gmail.com&dob=2021-04-03&anniversary_date=2021-04-03&d_area=gill%20nagar&d_city=chennai&d_state=tamil%20nadu&d_pincode=600094&d_doorno=12&d_aadhar_no=127832"
       //  let urlRequest = (APIList().getUrlString(url : .ADDNEWCUSTOMER))
        //let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestQueryItem(urlValue: urlRequest, requestBody: params))!
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: AddCustomerModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
              //  self.customerValueGetData = result!
                    completionHandler(result!)
            }else{
                completionHandler(nil)
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    func addNewBirthdayApi(birthday : String ,relation : String , documentId :String , name : String  , completionHandler :  @escaping (_ result: AddCustomerModel?)->Void){
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .ADDBIRTHDAYDATE)+birthday + "&name=\(name)" + "&doc_id=\(documentId)" + "&relation=\(relation)")
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: AddCustomerModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
              //  self.viewBirthdayModelDataGet = result!
                  completionHandler(result!)
            }else{
              
            }
            }
        }
        
    }
    
}
