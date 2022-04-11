//
//  ViewBirthdayCell.swift
//  AgniPrime
//
//  Created by MAC on 04/04/22.
//

import SwiftUI

struct ViewBirthdayCell: View {
    @State var getAllbirthdayValues : ViewBirthdayModelElement?
    var body: some View {
        VStack(spacing :8){
            HStack{
                Text("Name     : \(String(describing:getAllbirthdayValues?.name ?? ""))  (\(String(describing:getAllbirthdayValues?.relation ?? "")))")
                Spacer()
            }
            HStack{
                Text("Birthday : \(String(describing:getAllbirthdayValues?.birthday ?? ""))")
                Spacer()
            }
        }//.foregroundColor(.white)
    }
}

struct ViewBirthdayCell_Previews: PreviewProvider {
    static var previews: some View {
        ViewBirthdayCell()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 70))
         //   .background(Color.black)
    }
}
