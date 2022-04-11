//
//  StorageManager.swift
//  FoodSoldiers
//
//  Created by MAC on 01/07/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class StorageManager {
    static let sharedInstance = StorageManager()

    func storeDitributorId(id : String){
        UserDefaults.standard.set(id, forKey: Constants.UserDefaultkeys.distributeId)
    }
    func getDitributorId()->String?{
        return UserDefaults.standard.string(forKey: Constants.UserDefaultkeys.distributeId)
    }
    func storeUserName(name : String){
        UserDefaults.standard.set(name, forKey: Constants.UserDefaultkeys.fname)
    }
    func getUserName()->String?{
        return UserDefaults.standard.string(forKey: Constants.UserDefaultkeys.fname)
    }
    func setAliesId(type : String){
        UserDefaults.standard.set(type, forKey: Constants.AgniPrimeKeys.alies)
    }
    func getAliedId()->String?{
       return UserDefaults.standard.string(forKey: Constants.AgniPrimeKeys.alies)
    }
    func storeDemoCompleted(state:Bool){
        UserDefaults.standard.set(state, forKey: Constants.demoScreenShown)
    }
    func isDemoCompleted()->Bool {
        return  UserDefaults.standard.bool(forKey: Constants.demoScreenShown)
    }
    
    
    
    
    
    
    
    // ******************I
    func setAppUpdate(state:Bool){
        UserDefaults.standard.set(state, forKey: Constants.updateApp)
    }
    func getAppUpdate()->Bool {
        return  UserDefaults.standard.bool(forKey: Constants.updateApp)
    }

    func setLatitude(type: Double){
        UserDefaults.standard.set(type, forKey: Constants.UserDefaultkeys.latitude)
    }
    func getLatitude()->Double{
        return UserDefaults.standard.double(forKey: Constants.UserDefaultkeys.latitude)
    }

    func setCollectionOrDeliveryMode(type:Int){
        UserDefaults.standard.set(type, forKey: Constants.UserDefaultkeys.takeMode)
    }
    func getCollectionOrDeliveryMode()->Int{
        return UserDefaults.standard.integer(forKey: Constants.UserDefaultkeys.takeMode)
    }

   
    func removeObj(){
        
    }
    func setCid(type:Int){
        UserDefaults.standard.set(type, forKey: Constants.UserDefaultkeys.takeCid)
    }
    func getCid()->Int?{
        return UserDefaults.standard.integer(forKey: Constants.UserDefaultkeys.takeCid)
    }
    func setVcode(id:String){
        UserDefaults.standard.set(id, forKey: Constants.UserDefaultkeys.takeVode)
    }
    
    func getVcode()->String?{
        return UserDefaults.standard.string(forKey: Constants.UserDefaultkeys.takeVode)
    }
    func setTypeOfLogin(type:Int){
        UserDefaults.standard.set(type, forKey: Constants.UserDefaultkeys.typeOfLogin)
    }
    func getTypeOfLogin()->Int?{
        return UserDefaults.standard.integer(forKey: Constants.UserDefaultkeys.typeOfLogin)
    }
    func setLoginComplete(state:Bool){
        UserDefaults.standard.set(state, forKey: Constants.doneLogin)
    }
    func isLoginComplete()->Bool {
        return  UserDefaults.standard.bool(forKey: Constants.doneLogin)
    }
    func setSocialLogin(state:Bool){
        UserDefaults.standard.set(state, forKey: Constants.googleLogin)
    }
    func isGoogleLogin()->Bool {
        return  UserDefaults.standard.bool(forKey: Constants.googleLogin)
    }

    
    func storeProfileDetails(dict:[String:Any]){
        UserDefaults.standard.set(dict, forKey: Constants.UserDefaultkeys.profileDetails)
    }
    
    func fetchProfileDetails()->[String:Any]?{
        return UserDefaults.standard.dictionary(forKey: Constants.UserDefaultkeys.profileDetails)
    }

    func getCartDetails()->[[String:Any]]{
        return UserDefaults.standard.object(forKey: "Cart Details") as! [[String:Any]]
    }
    
    func removeLogoutDatas(){
        UserDefaults.standard.removeObject(forKey: Constants.UserDefaultkeys.distributeId)
        UserDefaults.standard.removeObject(forKey: Constants.UserDefaultkeys.fname)
        UserDefaults.standard.removeObject(forKey: Constants.AgniPrimeKeys.alies)
        UserDefaults.standard.removeObject(forKey: Constants.demoScreenShown)
    }
    
    
    func setCartDetails(value:[String:Any]){
        var cartDetails = getCartDetails()
        cartDetails.append(value)
        UserDefaults.standard.set(cartDetails,forKey: "Cart Details")
    }
    
    
}
