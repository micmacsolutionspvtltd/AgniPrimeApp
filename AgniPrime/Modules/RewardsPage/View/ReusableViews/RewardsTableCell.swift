//
//  RewardsTableCell.swift
//  AgniPrime
//
//  Created by MAC on 05/04/22.
//

import SwiftUI

struct RewardsTableCell: View {
    var getImages =  ""
    var getTexts = ""
    
   
  
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing : 5){
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: Constants.imageUrl + getImages)) { image in
                        image.resizable()
                        //image.frame(width: 60, height: 60)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                } else {
                    // Fallback on earlier versions
                }
                   // .resizable()
                   
               Text(getTexts)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width)
           
        }
    }
}

struct RewardsTableCell_Previews: PreviewProvider {
    static var previews: some View {
        RewardsTableCell()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 70))
            .padding()
    }
}
