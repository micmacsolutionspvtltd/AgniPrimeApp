//
//  AddSaleTextFieldView.swift
//  AgniPrime
//
//  Created by MAC on 30/03/22.
//

import SwiftUI

struct AddSaleTextFieldView: View {
    @Binding var textContent: String
    @State var placeHolder : String = ""
    @State var image : String = "person.fill"
    @State var keyBoardTypeValueGet : Int? = 1
    var body: some View {
        ZStack{
        
            HStack {
                Image(systemName: image)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 4))
                if keyBoardTypeValueGet == 1{
                    TextField(placeHolder,
                              text: $textContent)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding(EdgeInsets(top: 3, leading: 1, bottom: 4, trailing: 15))
                }else{
                    TextField(placeHolder,
                              text: $textContent)
                    .keyboardType(.numberPad)
                    .padding(EdgeInsets(top: 3, leading: 1, bottom: 4, trailing: 15))
                }
              
            }
            .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                .padding(EdgeInsets(top: 3, leading: 15, bottom: 4, trailing: 15))
            // .padding()
              //  .background(Capsule().fill(Color.white))
        }
        
    }
}

struct AddSaleTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AddSaleTextFieldView(textContent: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
