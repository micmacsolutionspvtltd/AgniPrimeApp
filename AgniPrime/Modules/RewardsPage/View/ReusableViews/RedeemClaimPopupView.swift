//
//  RedeemClaimPopupView.swift
//  AgniPrime
//
//  Created by MAC on 05/04/22.
//

import SwiftUI

struct RedeemClaimPopupView: View {
    @State var imageNames : String?
    @State var tittle : String?
    @State var  enterOtp = ""
    @Binding var showClaimPopUp : Bool?
    @Binding var showOtpPopUp : Bool?
    @ObservedObject var viewModel = RedeemViewModel()
    @State var enrollmentNumber :String = ""
    @State var productId :String = ""
    @State var totalPonits :String = ""
    @State var productPoint : String = ""
    @State var invalid : Bool = false
    var backPage : () -> ()
    
    var body: some View {
        VStack(spacing: 20){
          Text("Confirmation")
                .fontWeight(.semibold)
                .frame(width: 270)
                .padding()
                .background(Color.init(Constants.Color.yellowColor))
            if showOtpPopUp ?? false{
                HStack{
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 5))
                    VStack{
                        TextField("Enter The Otp", text: $enterOtp)
                            .keyboardType(.numberPad)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        Divider()
                            
                            .background(Color.black)
                        
                    }
                    
                }.padding([.trailing],20)
     
                if invalid{
                    Text("Invalid Otp Please try Again")
                        .foregroundColor(.red)
                        .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                }
                
            }else{
                VStack{
                Text(tittle ?? "")
                    .fontWeight(.semibold)
                    .frame(width: 270)
               
    //       Image("LogOut")
    //                .resizable()
    //        .frame(width: 60, height: 60)

                
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: Constants.imageUrl + (imageNames ?? ""))) { image in
                            image.resizable()
                            //image.frame(width: 60, height: 60)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                    } else {
                        // Fallback on earlier versions
                    }
             
            
            }
            }
            HStack(spacing : 40){
                Button {
                    showClaimPopUp = false
                    showOtpPopUp = false
                   // showSaleOrder = nil
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                        .background(Color.init(Constants.Color.yellowColor))
                        .cornerRadius(8)

                }
                Button {
                    if (showOtpPopUp ?? false){
                        if enterOtp.count <= 3 || enterOtp.count > 5{
                            invalid =  true
                        }else{
                        viewModel.redeemOtpValidate(redPoints: productPoint, product_id: productId, otp: enterOtp, enrollmentno: enrollmentNumber, points: totalPonits , completionHandler: ({ result in
                            if result != nil{
                                showClaimPopUp = false
                                showOtpPopUp = false
                                backPage()
                             //  print("sucess")
                            }else{
                                invalid =  true
                               print("failure")
                            }
                        }))
                            }
                    }else{
                        viewModel.redeemOtpSendApi(enrollMentNumber: enrollmentNumber)
                        showOtpPopUp = true
                    }
                   
                } label: {
                    if (showOtpPopUp ?? false){
                        Text("Submit")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(8)
                    }else{
                        Text("Claim")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(8)
                    }
                 
                      
                }
            }
         
          
        }
        .padding([.bottom],30).background(Color.white)
        .cornerRadius(10)
    }
}

//struct RedeemClaimPopupView_Previews: PreviewProvider {
//    static var previews: some View {
//        RedeemClaimPopupView(showClaimPopUp: .constant(false), showOtpPopUp: .constant(false))
//            .previewLayout(.fixed(width: 300, height: 250))
//    }
//}
