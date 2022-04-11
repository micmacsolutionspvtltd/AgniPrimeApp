//
//  LoginView.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import SwiftUI

struct LoginView: View {
    @State private var mobileNumber: String = ""
    @ObservedObject var viewModel = LoginDataViewModal()
    @State var moveOtpPage: Bool = false
    @State var loadingCreate : Bool = false
    @State var errorPopup : Bool? = false
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
                            TextField("Enter Mobile Number", text: $mobileNumber)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                                .padding()
                            
                            
                            
                            Button {
                                //    loadingCreate = true
                                if mobileNumber.count <= 9 || mobileNumber.count >= 11{
                                    errorPopup = true
                                }else{
                                    loadingCreate = true
                                    viewModel.loginValueApi(mobileNumber: mobileNumber) { result in
                                        if result?.count == 0{
                                            loadingCreate = false
                                            errorPopup = true
                                        }else{
                                            if result?[0].status == "invalid" {
                                                loadingCreate = false
                                                errorPopup = true
                                            }else{
                                                loadingCreate = false
                                                moveOtpPage = true
                                            }
                                        }
                                    }
                                }
                                
                            } label: {
                                Text("Submit")
                                    .foregroundColor(.black)
                                
                            }
                            .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(10)
                            .padding([.leading, .bottom, .trailing], 15.0)
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
               // }
              //
                    
                
            }    .background(
                NavigationLink(destination: OtpView(), isActive: $moveOtpPage) {
                  //  moveOtpPage = false
                    OtpView()
                    
                }
                .hidden()
                )
            .navigationBarHidden(true)
            .toast(isShowing: $errorPopup,textContent: Constants.ErrorKeys.inalidLoginNumber)

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


