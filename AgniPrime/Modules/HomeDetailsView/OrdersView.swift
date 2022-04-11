//
//  OrdersView.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import SwiftUI

struct OrdersView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var headerName = "ORDERS"
    var body: some View {
        GeometryReader{ getSizes in
            
            ScrollView{
                
                VStack(alignment: .center){
                    VStack(spacing : 40){
                        ZStack{
                            Text(headerName)
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
                    }
                }
                    Image("comingsoon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 30.0)
                      //  .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                        .position(x: getSizes.size.width / 2, y: getSizes.size.height / 2.4)
                
            }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
