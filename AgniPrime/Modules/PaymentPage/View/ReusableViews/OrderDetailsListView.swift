//
//  OrderDetailsListView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI


struct OrderDetailsListView: View {
    
    @State var getBillValueData : BillFullDetailsModelElement?
    
    var body: some View {
        VStack{
            HStack{

                VStack(alignment: .leading, spacing: 2){
                    HStack{
                        Text("Date")
                            .font(.system(size: 17))
                            .frame(width: 130,alignment: .leading)
    
                        Text(": \(getBillValueData?.date ?? "")")
                            .font(.system(size: 17))
                            .frame(alignment: .leading)
                            .minimumScaleFactor(0.5)
    
    
                    }
                    HStack{
                        Text("Amount")
                            .font(.system(size: 17))
                            .frame(width: 130,alignment: .leading)
                        Text(": ₹ \(getBillValueData?.amount ?? "")")
                            .font(.system(size: 17))
                            .frame(alignment: .leading)
    
                    }
                    HStack{
                        Text("Voucher Type")
                            .font(.system(size: 17))
                            .frame(width: 130,alignment: .leading)
    
                        Text(": \(getBillValueData?.vchType ?? "")")
                            .font(.system(size: 17))
                            .frame(alignment: .leading)
    
                    }
                    HStack{
                        Text("Voucher Number")
                            .font(.system(size: 17))
                            .frame(width: 130,alignment: .leading)
                        Text(": \(getBillValueData?.vchNo ?? "")")
                            .font(.system(size: 17))
                            .frame(alignment: .leading)
                    }
    
                }
    
            }
        }.padding()
    }
}

struct OrderDetailsListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsListView()
            .previewLayout(.sizeThatFits)
            .padding(10)
        
    }
}
