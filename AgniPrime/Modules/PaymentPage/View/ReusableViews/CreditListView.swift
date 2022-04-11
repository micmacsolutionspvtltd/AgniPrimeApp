//
//  CreditListView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI

struct CreditListView: View {
    
    @State var getCreditValuesData : CreditLimitModelElement?
 
    var body: some View {
        ZStack{
        VStack(alignment: .leading){
            HStack{
                Text("Order Id")
                    .frame(width :135,alignment: .leading)
                    .multilineTextAlignment(.leading)
             //  Spacer()
                Text(": \(getCreditValuesData?.orderID ?? "")")
                    .frame(alignment: .leading)
            }.padding([.leading,.trailing],5)
                .padding([.top],10)
        //    frame(width: UIScreen.main.bounds.width)
            HStack{
                Text("Invoice no. ")
                    .frame(width :135,alignment: .leading)
                Text(": \(getCreditValuesData?.invNo ?? "")")
                    .frame(alignment: .leading)
            }.padding([.leading,.trailing],5)
                .padding([.top],1)
            HStack{
                    Text("Invoice Date")
                    .frame(width :135,alignment: .leading)
                    
                    Text(": \(getCreditValuesData?.invDate ?? "")")
                    .frame(alignment: .leading)
                }.padding([.leading,.trailing],5)
                    .padding([.top],1)
                HStack{
                    Text("Total Value ")
                        .frame(width :135,alignment: .leading)
                    Text(": ₹ \(getCreditValuesData?.openAmt ?? "")")
                        .frame(alignment: .leading)
                }.padding([.leading,.trailing],5)
                    .padding([.top],1)
            HStack{
                Text("Paid Amt")
                    .frame(width :135,alignment: .leading)
                Text(": ₹ \(getCreditValuesData?.paidAmt ?? "")")
                    .frame(alignment: .leading)
            }.padding([.leading,.trailing],5)
                .padding([.top],1)
            HStack{
                Text("Outstanding amt")
                    .frame(width :135,alignment: .leading)
                Text(": ₹ \(getCreditValuesData?.outAmt ?? "")")
                    .frame(alignment: .leading)
            }.padding([.leading,.trailing],5)
                .padding([.top],1)
            HStack{
                Text("Credit Days")
                    .frame(width :135,alignment: .leading)
                Text(": \(getCreditValuesData?.creditDays ?? "")")
                    .frame(alignment: .leading)
            }.padding([.leading,.trailing],5)
                .padding([.top],1)
            HStack{
                Text("Remaining Days")
                    .frame(width :135,alignment: .leading)
                Text(": \(getCreditValuesData?.remainDays ?? "") Days")
                    .frame(alignment: .leading)
            }.padding([.leading,.trailing],5)
                .multilineTextAlignment(.leading)
                .padding([.top],1)
            
        }//.frame(height: 300)
           // .padding()
      //  .frame(width: UIScreen.main.bounds.width)
            
        }
    }
}

struct CreditListView_Previews: PreviewProvider {
    static var previews: some View {
        CreditListView()
            .previewLayout(.fixed(width: 300, height: 300))
           // .padding()
    }
}
extension View {
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
