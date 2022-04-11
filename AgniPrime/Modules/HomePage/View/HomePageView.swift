//
//  HomePageView.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import SwiftUI

struct HomeCollectionCell: View {
    
    var getValues : HomeMainModel
    
    var body: some View {
        VStack{
            Image(getValues.Image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
            Text(getValues.tittle)
                .foregroundColor(.black)
        }
        
       // .frame(width: 200, height: 200, alignment: .center)
//        .background(Color.init(uiColor: Constants.Color.yellowColor))
//        .padding()
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCollectionCell(getValues: HomeMainModel(tittle: "payment", Image: "LogOut"))
            .previewLayout(.sizeThatFits)
          //  .padding()
    }
}
