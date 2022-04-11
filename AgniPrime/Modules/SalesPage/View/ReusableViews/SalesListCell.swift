//
//  SalesListCell.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI

struct SalesListCell: View {
    var redeemButtonName = "Redeem"
    @State var getSalesValueData : SalesModelElement?
    @Binding var moveRedeemPage : String?
    @Binding var totalPoints : String?
    @Binding var saleOrderRow : String?
    @Binding var enrollmentNumber : String?

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
                    Text("Name")
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
                HStack{
                    HStack{
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundColor(.black)
                            //.padding()
                        Text("Credit Points")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(alignment :.leading)
                    }
                    .frame(width: 150,alignment: .leading)
                    Text(": \(getSalesValueData?.totalpoints ?? "")")
                        .font(.system(size: 14, weight: .semibold))
                        Spacer()
                }.padding([.trailing],10)
                    .padding([.top],1)
            VStack(alignment: .trailing){
            HStack{
                Spacer()
                if getSalesValueData?.totalpoints == nil || getSalesValueData?.totalpoints == "0" || (Double(getSalesValueData?.totalpoints ?? "0.00") ?? 0.00) < 40{
       
                }else{
                    Button {
                        //RewardPointsItemView(totalPoints : getSalesValueData?.totalpoints ?? "0.00")
                        totalPoints = getSalesValueData?.totalpoints ?? "0.00"
                        enrollmentNumber =  getSalesValueData?.dEnrollmentNo ?? ""
                        moveRedeemPage = redeemButtonName
                       
                    } label: {
                        Text(redeemButtonName)
                            .frame(height: 35)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color(red: 0.26, green: 0.314, blue: 0.492))
                            .cornerRadius(4)
                    }            .buttonStyle(PlainButtonStyle())

                }
              
                Button {
                 //  RewardPointsItemView()
            saleOrderRow = getSalesValueData?.dID ?? ""
         enrollmentNumber =  getSalesValueData?.dEnrollmentNo ?? ""
                } label: {
                    Text("Sales Order")
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
        
    }
}

struct SalesListCell_Previews: PreviewProvider {
    static var previews: some View {
        SalesListCell( moveRedeemPage: .constant(""), totalPoints: .constant("") , saleOrderRow: .constant(""), enrollmentNumber: .constant(""))
            .previewLayout(.sizeThatFits)
           // .padding(10)
    }
}
