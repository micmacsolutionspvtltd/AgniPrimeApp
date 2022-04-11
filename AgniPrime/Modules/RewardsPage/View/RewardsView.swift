//
//  RewardsView.swift
//  AgniPrime
//
//  Created by MAC on 30/03/22.
//

import SwiftUI

struct RewardsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showLoader : Bool = true
    @ObservedObject var viewModel = RedeemViewModel()

    var body: some View {
        GeometryReader{ geoMetry in
            ScrollView{
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
               VStack {
                   ForEach((0..<(viewModel.redeemValuesGetData?.data?.count ?? 0)), id : \.self) { rowCount in
                       Text("Reward Points : \(viewModel.redeemValuesGetData?.data?[rowCount].giftPoint ?? "") ")
                       HStack {
                           ForEach(0..<3, id: \.self) { col in
                               RedeemsCollectionCell(getImages: viewModel.redeemValuesGetData?.data?[rowCount].giftProducts?[col].productImage ?? "" , getTexts: viewModel.redeemValuesGetData?.data?[rowCount].giftProducts?[col].productName ?? "")
                                   .frame(width: geoMetry.size.width/3.3, height: 140)
                                   
                                   .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1))
                                   //.shad
                                   
                           }
                       }
                   }
               }
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }.onAppear(){
            showLoader = true
            viewModel.redeemValuesGetApi(completionHandler: ({ result in
                showLoader = false
            }))
        }
        .loaderView(isShowing: $showLoader)
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}
