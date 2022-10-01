//
//  AddbirthDayPopupView.swift
//  AgniPrime
//
//  Created by MAC on 30/03/22.
//

import SwiftUI

struct AddbirthDayPopupView: View {
    @State var docId : String? 
    @Binding var clickAddBirthdayClicked : Bool?
   // @EnvironmentObject var customViewModel: MainViewModelFile

    var body: some View {
        VStack{
            Text("Choose Relation")
                .fontWeight(.semibold)
            Divider()
            Button {
                clickAddBirthdayClicked = true
            } label: {
                Text("ADD BIRTHDAY")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                

            }
            .background(Color.white)
            .frame(width: 260)
            .padding()
            .background(Color.white)
                .cornerRadius(8)
            NavigationLink {
               
                ViewBirthdayView(docId : docId ?? "")
            } label: {
                Text("VIEW BIRTHDAY")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            .frame(width: 260)
            .padding()
            .background(Color.white)
            .cornerRadius(8)

        }
       // .frame(width: 380, height: 300)
       // .cornerRadius(8)
       // .background(Color.init(Constants.Color.yellowColor))
    }
}

struct AddbirthDayPopupView_Previews: PreviewProvider {
    static var previews: some View {
        AddbirthDayPopupView( clickAddBirthdayClicked: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
