//
//  RewardPointsItemView.swift
//  AgniPrime
//
//  Created by MAC on 05/04/22.
//

import SwiftUI

struct RewardPointsItemView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = RedeemViewModel()
    @State var totalPoint : String = ""
    @State var redeemPointsBasedValueGetData : RedeemListValuesModel?
    @State var showClaimPopUp : Bool? = false
    @State var showOtpPopup : Bool? = false
    @State var getImageName : String?
    @State var getTittle : String?
    @State var enrollMentNumber : String = ""
    @State var productId :String = ""
    @State var productPoints : String = ""
    @State var errorPoupShow : Bool? = false
    @State var errorMsg : String = ""
    @State var showLoader : Bool = false

    
    var body: some View {
        GeometryReader{ geoMetry in
            ZStack{
            VStack{
                ZStack{
                    Text("REWARDS")
                        .fontWeight(.semibold)
                        .padding()
                    HStack{
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()

                        } label: {
                            Image(systemName:"arrow.left")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                                .padding()
                        }
                        Spacer()
                    }
                    
                }
                .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
        
            .background(Color.init(Constants.Color.yellowColor))
                List((redeemPointsBasedValueGetData?.productData ?? []), id : \.self){ item in
                    Button{
                        getImageName = item.productImage ?? ""
                        getTittle = item.productName
                        productId = item.dppID ?? ""
                        productPoints = item.productPoints ?? ""
                      showClaimPopUp = true
                    } label: {
                        RewardsTableCell(getImages: item.productImage ?? "", getTexts: item.productName ?? "")
                            .frame(width: UIScreen.main.bounds.width, height: 70)
                    }
                    
                }
            }
        }
            if (showClaimPopUp ?? false){
                GeometryReader{_ in

                    RedeemClaimPopupView(imageNames: getImageName, tittle: getTittle,showClaimPopUp: $showClaimPopUp,showOtpPopUp :$showOtpPopup ,  enrollmentNumber : enrollMentNumber , productId : productId , totalPonits : totalPoint ,productPoint: productPoints, backPage: (({
                        errorMsg = "REDEEM REQUESTED SUCESSFULLY"
                        showLoader = true
                        errorPoupShow = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            showLoader = false
                            presentationMode.wrappedValue.dismiss()
                        }
                       
                    })))
                  //  RedeemClaimPopupView(imageNames: getImageName, tittle: getTittle,showClaimPopUp :$showClaimPopUp,showOtpPopUp: $showOtpPopup,enrollmentNumber :enrollMentNumber,productId : productId, productPoint : productPoint , totalPoints : totalPoints)
                    
                        .frame(width: 300, height: 250)
                        .padding()
                      //.background(Color.init(Constants.Color.yellowColor))
                         .cornerRadius(8)
                        .position(x: geoMetry.size.width / 2, y: geoMetry.size.height / 2)

                }
                .background(Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                        withAnimation {
                            showClaimPopUp = false
                        }
                    })
            }
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                showLoader = true
                viewModel.redeemListValueGetApi(totalPoints: totalPoint, completionHandler: { result in
                    redeemPointsBasedValueGetData = result
                    if result?.reason != ""{
                        errorMsg = result?.reason ?? ""
                        showLoader = false
                        errorPoupShow = true
                    }else{
                        showLoader = false
                    }
                })
                    
            }
            .toast(isShowing: $errorPoupShow , duration: 4.0 ,textContent: errorMsg)
            .loaderView(isShowing: $showLoader)
    }
}

struct RewardPointsItemView_Previews: PreviewProvider {
    static var previews: some View {
        RewardPointsItemView()
    }
}
