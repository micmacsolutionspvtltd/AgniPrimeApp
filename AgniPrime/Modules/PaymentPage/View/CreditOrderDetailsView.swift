//
//  CreditOrderDetailsView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI

struct CreditOrderDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = CreditLimitViewModel()
    @State var getAllDatas : [BillFullDetailsModelElement]? = []
    @State var showLoader : Bool = true

    
    var billNo : String?
    var body: some View {
        GeometryReader{ getSizes in
            VStack{
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
                             //   .padding()
                        }
                        Spacer()
                }
                        
                }.padding()
                    .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                
                    .background(Color.init(Constants.Color.yellowColor))
            
          //  ScrollView{
                List{
                    ForEach((getAllDatas ?? [])){ item in

              OrderDetailsListView(getBillValueData: item)
                       // .frame(height : 120)
                }
          }.environment(\.defaultMinListRowHeight, 20)
            
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
       //     }
          //  }
            .onAppear(){
                viewModel.particularBillDataGetApi(billNo: billNo ?? "") { result in
                    self.getAllDatas = result
                    showLoader = false
                }
            }
            .loaderView(isShowing: $showLoader)

        }
    }
}

struct CreditOrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditOrderDetailsView()
    }
}
