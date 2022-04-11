//
//  LoginViewModel.swift
//  AgniPrime
//
//  Created by MAC on 31/03/22.
//

import Foundation


class LoginDataViewModal: ObservableObject{

    @Published var otpLoginData : [OtpModel]? = []
    @Published var mobLoginData : [LoginPageModelElement]? = []

    
    func loginValueApi(mobileNumber: String, completionHandler:@escaping(_ result: LoginPageModel?)->Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .LOGINMOBILENUMBER) + mobileNumber)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: LoginPageModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.mobLoginData = result!
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    //Otp Value Check Api Call
    
    func otpCheckApiCall(otpNumber: String, completionHandler:@escaping(_ result: OtpValueModel?)->Void) {
        let params : [String : Any]? = nil

        let urlRequest = (APIList().getUrlString(url : .OTPNUMBER) + otpNumber)
        let setRequest = (try?  RequestGenerator.sharedInstance.generateURLRequest(urlValue: urlRequest,sendMethod : "get", requestBody: params))!
        NetWorkManger.sharedInstance.postData(request: setRequest, resultType: OtpValueModel.self) { (restValue, result, error) in
            DispatchQueue.main.async {

            if restValue == true{
                self.otpLoginData = result!
               
                    completionHandler(result!)
            }else{
               // self.delegate?.didFailWithError(error: String(error?.localizedDescription ?? ""))
            }
            }
        }
        
    }
    
    
}
