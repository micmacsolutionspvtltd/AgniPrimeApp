//
//  PaymentCreditPage.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import SwiftUI

struct PaymentCreditView: View {
    //  @Environment(\.rootPresentation) var rootPresentation: Binding<PresentationMode>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @ObservedObject var viewModel = CreditLimitViewModel()
    @State private var linkActive = false
    @State var showLoader : Bool = true
    
    let HomeModel: [HomeMainModel] = [
        HomeMainModel( tittle: "Payment", Image: "0"),
        HomeMainModel( tittle: "Orders", Image: "0"),
        HomeMainModel( tittle: "SaleEntry", Image: "0"),
        HomeMainModel(tittle: "Project", Image: "0"),
    ]
    var body: some View {
        GeometryReader{ getSizes in
            
            ScrollView{
                
                VStack(alignment: .center){
                    //  VStack(spacing : 10){
                    ScrollView{
                        ZStack{
                            Text("CREDIT LIMIT")
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
                        // .padding()
                        .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                        
                        .background(Color.init(Constants.Color.yellowColor))
                        
                        VStack(spacing : 20){
                            VStack(spacing : 10){
                                HStack{
                                    Text("Name")
                                        .font(.system( size: 16, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil)
                                        .frame(width: 140,alignment: .leading)
                                    
                                    Text(":  \(StorageManager.sharedInstance.getUserName() ?? "")")
                                        .font(.system( size: 16, weight: .semibold))
                                      //  .lineLimit(2)
                                     Spacer()
                                    // .frame(width: .infinity)
                                }
                                .frame(width: UIScreen.main.bounds.width/1.2)
                                HStack{
                                    Text("Total Outstanding")
                                        .font(.system( size: 16, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 140,alignment: .leading)
                                    
                                    
                                    
                                    Text(": \(viewModel.billDetailsDatas?.pendingBillsAmt ?? "")")
                                        .font(.system( size: 16, weight: .semibold))
                                       
                                    Spacer()
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width/1.2)
                            }
                            HStack{
                                ForEach((0...3),id : \.self){ item in
                                    if item == 0{
                                        CreditLimitPageDaysView(daysName: "Less Than 10 days", days: String((viewModel.billDetailsDatas?.lessThan10_DaysPendingAmt ?? 0)),upViewBgColor: Color(red: 0.891, green: 0.726, blue: 0.174))
                                            .frame(height : 95)
                                            .cornerRadius(3)
                                    }else if item == 1{
                                        CreditLimitPageDaysView(daysName: "10 - 20 Days", days: String((viewModel.billDetailsDatas?.bw10_20_PendingAmt ?? 0)),upViewBgColor: Color(red: 0.706, green: 0.128, blue: 0.13))
                                            .frame(height : 95)
                                            .cornerRadius(3)
                                    }else if item == 2{
                                        
                                        CreditLimitPageDaysView(daysName: "20 - 30 days", days: String((viewModel.billDetailsDatas?.bw20_30_PendingAmt ?? 0)),upViewBgColor: Color(red: 0.706, green: 0.133, blue: 0.125))
                                            .frame(height : 95)
                                            .cornerRadius(3)
                                    }else{
                                        CreditLimitPageDaysView(daysName: "Greater than 10 days", days: (viewModel.billDetailsDatas?.greaterThan30_DaysPendingAmt ?? ""),upViewBgColor: Color(red: 0.972, green: 0.035, blue: 0.033))
                                            
                                            .frame(height : 95)
                                        
                                            .cornerRadius(3)
                                    }
                                    
                                    
                                    // .padding()
                                    //                                            .frame(maxWidth: .infinity)
                                    //                                            .frame(height : 150)
                                    //                                            //.clipped()
                                    //                                            .cornerRadius(8)
                                    
                                }
                            }.frame(height : 95)
                            
                        }.padding()
                            .frame(maxWidth: getSizes.size.width*0.85, minHeight :200, maxHeight: 200)
                            .padding()
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(10)
                        
                    }
                    VStack{
                        //  if viewModel.creditLimiGetData != nil{
                        
                        List{
                            ForEach((viewModel.creditLimiGetData ?? []), id : \.self){ item in
                                
                                Button(action: { linkActive = true }) {
                                    CreditListView(getCreditValuesData : item)
                                    
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                    // .cornerRadius(10)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.white)
                                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1))
                                  
                                    
                                }.overlay(VStack {
                                    if linkActive {
                                        NavigationLink(destination:  CreditOrderDetailsView(billNo: item.invNo?.removeWhitespace()), isActive: $linkActive) {
                                            CreditOrderDetailsView(billNo: item.invNo?.removeWhitespace())
                                                .padding()
                                                .background(Color.red)
                                        }.opacity(0)
                                        //.padding()
                                            .background(Color.red)
                                        
                                    }
                                })
                                
                            }
                            
                            
                            
                            
                        }//
                        
                        
                        
                        .listStyle(PlainListStyle())
                        .frame(height: getSizes.size.height - 50)
                        
                        
                        
                        
                    }
                    
                }
            }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }.onAppear(){
            viewModel.creditLimitValueGetApi()
            viewModel.distributorBillingDetailsGetApi()
        }
        // .loaderView(isShowing: $showLoader)
    }
    
}

struct PaymentCreditPage_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCreditView()
            .previewLayout(.sizeThatFits)

    }
}
