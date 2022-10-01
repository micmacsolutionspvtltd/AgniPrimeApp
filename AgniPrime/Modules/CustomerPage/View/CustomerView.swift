//
//  CustomerView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI

struct CustomerView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = CustomerViewModel()
    @State var getDocId : String = ""
    @State var viewGetModel = CustomerViewModel()
    @State var addBirthdayPopUp : Bool = false
    @State var selectBirthadayPopUp : Bool? = nil
    @State var selectedFruit: String?
    @State var showSaleOrder : String?
    @EnvironmentObject var customViewModel: MainViewModelFile
    @State var enrollMentNumber : String?
    @State var saleSubmitClicked : String?
    @State var clickAddBirthdayClicked : Bool?
    @State var showToastText : String? = ""
    @State var showToast : Bool? = false
    @State var finalSubmitClick : Bool? = false
    @State var errorPoupShow : Bool? = false
    @State var errorMsgs : String? = ""

    
    var body: some View {
        GeometryReader{ geoMetry in
            ZStack{
                VStack(alignment: .center, spacing : 2){
                    ZStack{
                        Text("UNAPPROVED CLIENT")
                            .fontWeight(.semibold)
                            .padding()
                        HStack{
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                                
                            } label: {
                                Image(systemName: "arrow.left")
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
                    
                    List((viewModel.customerValueGetData ?? []), id : \.self){ item in
                        //                    Button{
                        //                        getDocId = item.dID ?? ""
                        //                        addBirthdayPopUp = true
                        //                       // ViewBirthdayView(docId : item.dID ?? "")
                        //                      //  print(item)
                        //                    }label:{
                        CustomerListCell(getSalesValueData: item, selctedButtonRow: $selectedFruit, saleOrderRow: $showSaleOrder,showToast : .constant(false), errorMsgs : .constant(""),loaderCreatred:  .constant(false))
                        //  }
                        
                    }
                }
                NavigationLink {
                    AddSaleView()
                } label: {
                    Text("+")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .padding()
                        .cornerRadius(25)
                    
                }
                .frame(width: 50, height: 50)
                .background(Color.init(Constants.Color.yellowColor))
                .cornerRadius(25)
                //.alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                .position(x: geoMetry.size.width / 1.1, y: geoMetry.size.height / 1.08)
                
            }
            if (customViewModel.showPopUpValue == true){
                GeometryReader{_ in
                    AddbirthDayPopupView(docId: selectedFruit, clickAddBirthdayClicked: $selectBirthadayPopUp)
                        .frame(width: 340, height: 220)
                        .background(Color.init(Constants.Color.yellowColor))
                        .background(Color.init(Constants.Color.yellowColor))
                        .cornerRadius(8)
                    
                        .position(x: geoMetry.size.width / 2, y: geoMetry.size.height / 2)
                    
                }
                .background(Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            addBirthdayPopUp.toggle()
                            selectedFruit = nil
                            customViewModel.showPopUpValue = false
                        }
                    })
            }
            ////
            if selectBirthadayPopUp ?? false{
                GeometryReader{_ in
                    AddChildInformationView(docId : selectedFruit , clickAddBirthdayClicked : $selectBirthadayPopUp,errorPoupShowed : $errorPoupShow , errorMsg : $errorMsgs)
                        .frame(width: 340, height: 370)
                    //  .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .position(x: geoMetry.size.width / 2, y: geoMetry.size.height / 2)
                    
                }
                .background(Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            // addBirthdayPopUp.toggle()
                            selectBirthadayPopUp =  false
                            customViewModel.showPopUpValue = false
                        }
                    })
            }
            if (showSaleOrder != nil){
                GeometryReader{_ in
                    SaleOrderPopView(showSaleOrder: $showSaleOrder, enrollmentNumber: enrollMentNumber, submitClicked: $errorPoupShow, errorMsg: $errorMsgs,finalSubmitClicked : $finalSubmitClick ,quantityValue: viewModel.stockQuantityDataGet?.quantity ?? "" , takeValues :({
                        
                    }))

                    .frame(width: 300, height: 350)
                    .padding()
                    //.background(Color.init(Constants.Color.yellowColor))
                    .cornerRadius(8)
                    .position(x: geoMetry.size.width / 2, y: geoMetry.size.height / 2)
                    
                }
                .background(Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            addBirthdayPopUp.toggle()
                            showSaleOrder = nil
                        }
                    })
            }
            
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear(){
                customViewModel.showPopUpValue = false
                viewModel.customerValueGetApi()
                viewModel.stockQuatityGetApi()
            }
            .toast(isShowing: $errorPoupShow, duration: 3.0, textContent: errorMsgs ?? "")
    }

}

//struct CustomerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomerView()
//    }
//}
