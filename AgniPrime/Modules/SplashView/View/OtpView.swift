//
//  OtpView.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import SwiftUI
import Combine

struct OtpView: View {
    @State private var otpNumber: String = ""
    @ObservedObject var viewModel = LoginDataViewModal()
    @State var selection: Bool = false
    @State var errorPopup : Bool? = false
    @State var loadingCreate : Bool = false
    
    var body: some View {
        GeometryReader{ gp in
          
                ZStack(){
                    ScrollView{
                    VStack(spacing : 50){
                        Image("LoginPage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 30.0)
                        
                        VStack(alignment: .center){
                            TextField("Enter Otp", text: $otpNumber)
                            
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                                .padding()
                            
                            
                            Button {
                                if otpNumber.count == 0 || otpNumber.count <= 3 || otpNumber.count > 5{
                                    errorPopup = true
                                }else{
                                    loadingCreate = true
                                    viewModel.otpCheckApiCall(otpNumber: otpNumber) { result in
                                        if result?.count == 0{
                                            loadingCreate = false
                                            errorPopup = true
                                        }else{
                                            
                                            StorageManager.sharedInstance.setAliesId(type: result?[0].alies ?? "")
                                            StorageManager.sharedInstance.storeUserName(name: result?[0].doctorName ?? "")
                                            
                                            StorageManager.sharedInstance.storeDitributorId(id: result?[0].id ?? "")
                                            StorageManager.sharedInstance.storeDemoCompleted(state: true)
                                            loadingCreate = false
                                        
                                            selection = true
                                        }
                                    }
                                }
                               
                                //HomeView()
                              //  selection = true
                            } label: {
                                Text("Submit")
                                    .foregroundColor(.black)
                                
                            }
                            .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(10)
                            .padding([.leading, .bottom, .trailing], 15.0)
                            // }
                        }
                        Spacer()
                    }
                    .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                    .position(x: gp.size.width / 2, y: gp.size.height / 2)
                    
                    
                }
                    if loadingCreate{
                        
                        CustomLoaderView()
                            .position(x: gp.size.width / 2, y: gp.size.height / 2)
                    }
                    
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .background(
                    NavigationLink(destination: HomeView(), isActive: $selection) {
                        HomeView()
                    }
                        .hidden()
                )
                .toast(isShowing: $errorPopup , textContent: Constants.ErrorKeys.invalidotp)
        }
    }

}

struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView()
    }
}


