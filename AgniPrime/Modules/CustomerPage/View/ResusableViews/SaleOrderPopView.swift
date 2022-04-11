//
//  SaleOrderPopView.swift
//  AgniPrime
//
//  Created by MAC on 30/03/22.
//

import SwiftUI

struct SaleOrderPopView: View {
    @State var enterQty = ""
    @State var enterAmt  = ""
    @State var enterRemarks = ""
    @Binding var showSaleOrder : String?
    @State var enrollmentNumber : String?
    @State var did : String?
    @Binding var submitClicked : Bool?
    @Binding var errorMsg : String?
    @Binding var finalSubmitClicked : Bool?
    @ObservedObject var viewModel = SalesViewModel()
    
    var quantityValue = ""
    var takeValues : () -> ()
    var body: some View {
        VStack(spacing: 20){
            Text("Sales Order")
                .fontWeight(.semibold)
                .frame(width: 270)
                .padding()
                .background(Color.init(Constants.Color.yellowColor))
            Text("Stock Quantity : \(quantityValue)")
                .fontWeight(.semibold)
                .frame(width: 270)
            VStack{
                HStack{
                    Image("bag")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 5))
                    VStack{
                        TextField("Enter Quantity in KG", text: $enterQty)
                            .keyboardType(.numberPad)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        Divider()
                            .background(Color.black)
                    }
                    
                }.padding([.trailing],20)
                HStack{
                    Image("rupeeindian")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 5))
                    VStack{
                        TextField("Enter The Amount", text: $enterAmt)
                            .keyboardType(.numberPad)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        Divider()
                        
                            .background(Color.black)
                        
                    }
                }.padding([.trailing],20)
                HStack{
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 5))
                    VStack{
                        TextField("Remarks (Optional)", text: $enterRemarks)
                            
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        Divider()
                            .background(Color.black)
                    }
                }.padding([.trailing],20)
            }
            
            HStack(spacing : 40){
                Button {
                    showSaleOrder = nil
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                        .background(Color.init(Constants.Color.yellowColor))
                        .cornerRadius(8)
                    
                }
                Button {
                    if enterQty.count == 0{
                        errorMsg = "Please Enter Quantity"
                        submitClicked = true
//                        showSaleOrder = nil
                        
                    }else if enterAmt.count == 0 {
                        errorMsg = "Please Enter amount"
                        submitClicked = true
//                        showSaleOrder = nil
                    }
                    else{
                        viewModel.productSalesApi(enrollMentNumber: (enrollmentNumber ?? ""), kg: enterQty, did: showSaleOrder ?? "", remarks: enterRemarks, amount: enterAmt, ton: String(((Float(enterQty) ?? 0.0)/1000.00)), completionHandler: { result in
                            
                            if result?.status == "true"{
                                errorMsg = result?.msg ?? ""
                                takeValues()
                                submitClicked = true
                                showSaleOrder = nil
                            }else{
                                errorMsg = result?.msg ?? ""
                                submitClicked = true
                                showSaleOrder = nil
                            }
                        })
                    }
                } label: {
                    Text("Submit")
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                        .background(Color.init(Constants.Color.yellowColor))
                        .cornerRadius(8)
                }
            }
        }
        .padding([.bottom],30).background(Color.white)
        .cornerRadius(10)
        
        
    }
}

//struct SaleOrderPopView_Previews: PreviewProvider {
//    static var previews: some View {
//        SaleOrderPopView(showSaleOrder: .constant(""), submitClicked: .constant(false), errorMsg: .constant(""), finalSubmitClicked: .constant(false))
//            .previewLayout(.fixed(width: 300, height: 350))
//          //  .padding()
//    }
//}
