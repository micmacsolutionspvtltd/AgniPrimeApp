//
//  SalesView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI

struct SalesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var customViewModel: MainViewModelFile
    @State var salesValueGetData : [SalesModelElement]? = []

    @State var totalPoints : String? = nil
    @ObservedObject var viewModel = SalesViewModel()
    @State var moveRedeemPage: String? = nil
    @State var showSaleOrder : String?
    @State var enrollMentNumber : String?
    @State var viewGetModel = CustomerViewModel()
    @State var saleSubmitClicked : Bool? = false
    @State var showToast : Bool? = false
    @State var showToastText : String? = ""
    @State var finalSubmitClick : Bool? = false
    @State var showLoader : Bool = true

    var body: some View {
        GeometryReader{ geoMetry in
            ZStack{
            VStack(alignment: .center, spacing : 2){
                HStack{
                   
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                    Text("SALES")
                        .fontWeight(.bold)
                        .padding().foregroundColor(.black)
                    Spacer()
                    Button {
                      

                    } label: {
                        Image(systemName: "")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding()
                    }
                }//.padding()
                .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                        
                .background(Color.init(Constants.Color.yellowColor))
              //  }
                List((salesValueGetData ?? []), id : \.self){ item in
                  
                    SalesListCell(redeemButtonName: "Redeem", getSalesValueData: item, moveRedeemPage: $moveRedeemPage, totalPoints: $totalPoints, saleOrderRow: $showSaleOrder, enrollmentNumber: $enrollMentNumber)
                }
            }
                if finalSubmitClick ?? false{
//                    viewModel.salesValueGetApi(completionHandler: { result in
//                        salesValueGetData = result
//                    })
                }
                if (showSaleOrder != nil){
                    GeometryReader{_ in

                        SaleOrderPopView(showSaleOrder : $showSaleOrder,  enrollmentNumber: enrollMentNumber, submitClicked: $showToast, errorMsg: $showToastText, finalSubmitClicked : $finalSubmitClick, quantityValue : viewGetModel.stockQuantityDataGet?.quantity ?? "", takeValues: ({
                            viewModel.salesValueGetApi(completionHandler: { result in
                              //  showToast = false
                                salesValueGetData = result
                            })
                        }))
                      //  SaleOrderPopView(showSaleOrder : $showSaleOrder,  enrollmentNumber: enrollMentNumber, submitClicked: $showToast, errorMsg: $showToastText, quantityValue : viewGetModel.stockQuantityDataGet?.quantity ?? "",finalSubmitClick : $finalSubmitClick)
                            .frame(width: 300, height: 370)
                            //.padding()
                          //.background(Color.init(Constants.Color.yellowColor))
                             .cornerRadius(8)
                            .position(x: geoMetry.size.width / 2, y: geoMetry.size.height / 2)

                    }
                    .background(Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                            withAnimation {
                                showSaleOrder = nil
                            }
                        })
                }
        }

            
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

          
            .onAppear(){
                showLoader = true
                showSaleOrder = nil
                viewModel.salesValueGetApi(completionHandler: { result in
                    showLoader = false
                    salesValueGetData = result
                })
                viewGetModel.stockQuatityGetApi()
            }
       

            .background(
       
                
                NavigationLink(destination: RewardPointsItemView(totalPoint : totalPoints ?? "0",enrollMentNumber : enrollMentNumber ?? "0"), tag: "Redeem", selection: $moveRedeemPage) {
               
            }
            
            .hidden()
            )
            .toast(isShowing: $showToast , duration : 4.0, textContent: showToastText ?? "")
            .loaderView(isShowing: $showLoader)
    }
  
}

struct SalesView_Previews: PreviewProvider {
    static var previews: some View {
        SalesView()
    }
}
