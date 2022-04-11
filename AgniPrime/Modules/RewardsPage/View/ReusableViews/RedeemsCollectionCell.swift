//
//  RedeemsCollectionCell.swift
//  AgniPrime
//
//  Created by MAC on 02/04/22.
//

import SwiftUI

struct RedeemsCollectionCell: View {
    var getImages =  ""
    var getTexts = ""
    
    var body: some View {
        VStack{
            if #available(iOS 15.0, *) {
//                AsyncImage(url: URL(string: Constants.imageUrl + getImages))
//                    Image.resizable()
//                    .frame(width: 50, height: 60)
                AsyncImage(url: URL(string: Constants.imageUrl + getImages)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
             
            } else {
                // Fallback on earlier versions
            }
              //  .frame(height: 60)
              //  .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 60, alignment: .center)
            Text(getTexts)
                .foregroundColor(.black)
                .font(.system(size: 12))
                .lineLimit(2)
            
        }

    }
}

struct RedeemsCollectionCell_Previews: PreviewProvider {
    static var previews: some View {
        RedeemsCollectionCell()
            .previewLayout(.sizeThatFits)

    }
}
