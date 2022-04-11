//
//  CreditLimitPageDaysView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI

struct CreditLimitPageDaysView: View {
     var daysName : String
     var days : String
    var upViewBgColor : Color
    var body: some View {
        VStack(alignment : .center , spacing: 0, content: {
            
                Text(daysName)
                    .font(.system( size: 12, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                //    .padding()
                    .frame(width: UIScreen.main.bounds.width/5,height: 60)
                    .background(upViewBgColor)

                Text(days)
                    .font(.system( size: 12, weight: .semibold))

                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                 //   .padding()
                   // .frame(minWidth : .infinity)
                    .frame(width: UIScreen.main.bounds.width/5,height: 35)
                    .background(Color(red: 0.23, green: 0.266, blue: 0.296))
                    //.pad
            
        })
       // .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3))
        .frame(height : 95)
        //.frame(width: UIScreen.main.bounds.width/5,height: 180)
    }
}

struct CreditLimitPageDaysView_Previews: PreviewProvider {
    static var previews: some View {
        CreditLimitPageDaysView(daysName: "GreaterThan", days: "0", upViewBgColor: Color.red)
            .previewLayout(.sizeThatFits)
            
           // .padding(10)
    }
}
