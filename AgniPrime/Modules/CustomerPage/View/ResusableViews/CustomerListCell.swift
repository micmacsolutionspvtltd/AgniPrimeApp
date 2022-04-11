//
//  CustomerListCell.swift
//  AgniPrime
//
//  Created by MAC on 02/04/22.
//

import SwiftUI

struct CustomerListCell: View {
 //   var redeemButtonName = "Add Birthday"
 //  @State var buttonClick: () -> Void
   // @Binding
    @State var saleModeButton = "Sales Order"
    @State var getSalesValueData : CustomerModelElement?
    @Binding var selctedButtonRow :String?
    @Binding var saleOrderRow : String?
    @ObservedObject var viewModel = CustomerViewModel()
    @EnvironmentObject var customViewModel:MainViewModelFile
    @State var enrollMentNumber : String?
    @Binding var showToast : Bool?
    @Binding var errorMsgs : String
    @Binding var loaderCreatred : Bool
    
    var body: some View {
        VStack{
            VStack(alignment: .trailing){
                HStack{
                    Spacer()
                    Text("Enroll No : \(getSalesValueData?.dEnrollmentNo ?? "")")
                        .frame(height: 35)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color(red: 0.26, green: 0.314, blue: 0.492))
                       
                        .cornerRadius(4)
                    Text("Type : \(getSalesValueData?.dType ?? "")")
                        .frame(height: 35)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color(red: 0.678, green: 0.074, blue: 0.343))
                        .cornerRadius(4)
                }.padding()
            }
         
            
            HStack{
                HStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.black)
                        //.padding()
                    Text("Order Id")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(alignment :.leading)
                }
                .frame(width: 150,alignment: .leading)
                Text(": \(getSalesValueData?.dName ?? "")")
                    .font(.system(size: 14, weight: .semibold))
                    Spacer()
            }.padding([.trailing],10)
                .padding([.top],1)
            HStack{
                HStack{
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.black)
                        //.padding()
                    Text("Mobile")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(alignment :.leading)
                }
                .frame(width: 150,alignment: .leading)
                Text(": \(getSalesValueData?.dMobile ?? "")")
                    .font(.system(size: 14, weight: .semibold))
                    Spacer()
            }.padding([.trailing],10)
                .padding([.top],1)
            HStack{
                HStack{
                    Image(systemName: "location.fill")
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.black)
                        //.padding()
                    Text("Address")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(alignment :.leading)
                }
                .frame(width: 150,alignment: .leading)
                Text(":\(getSalesValueData?.dAddress ?? "")")
                    .font(.system(size: 14, weight: .semibold))
                    Spacer()
                }.padding([.trailing],2)
                    .padding([.top],1)
            VStack(alignment: .trailing){
            HStack{
                Spacer()
                if saleModeButton == "Sales Order"{
                    Button {
                        selctedButtonRow = getSalesValueData?.dID ?? ""
                        customViewModel.showPopUpValue = true
                    } label: {
                        Text("Add Birthday")
                            .frame(height: 35)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color(red: 0.26, green: 0.314, blue: 0.492))
                            .cornerRadius(4)
                    }
                    .buttonStyle(PlainButtonStyle())
                }else{
                    
                }

               
              
                Button {
                    if saleModeButton == "Sales Order"{
                        saleOrderRow = getSalesValueData?.dID ?? ""
                        enrollMentNumber = getSalesValueData?.dEnrollmentNo ?? ""
                    }else{
                        loaderCreatred = true
                        viewModel.addThisCustomerApi(enrollMentNumber: getSalesValueData?.dEnrollmentNo ?? "", completionHandler: ({ result in
                            if result != nil{
                                showToast = true
                                errorMsgs = result?.msg ?? ""
                            }else{
                                
                            }
                            loaderCreatred = false
                        }))
                    }
                  

                } label: {
                    Text(saleModeButton)
                        .frame(height: 35)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.orange)
                        .cornerRadius(4)
                }
                .buttonStyle(BorderlessButtonStyle())
            }.padding(10)
            }
            
        }//.frame(height: 300)
           // .padding()
        .foregroundColor(.black)
        
    }
}

//struct CustomerListCell_Previews: PreviewProvider {
// 
//
//    static var previews: some View {
//       
//        CustomerListCell(selctedButtonRow: .constant(""), saleOrderRow: .constant(""))
//        
//    }
//}
