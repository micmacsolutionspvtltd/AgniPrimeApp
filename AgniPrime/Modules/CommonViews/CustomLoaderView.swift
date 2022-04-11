//
//  CustomLoaderView.swift
//  AgniPrime
//
//  Created by MAC on 06/04/22.
//

import SwiftUI

struct CustomLoaderView: View {
    var body: some View {
        ZStack{
            if #available(iOS 14.0, *) {
                Color(.systemBackground)
                    .ignoresSafeArea()
                    .opacity(0.75)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
                    .scaleEffect(5)
            } else {
                // Fallback on earlier versions
            }
        
            
        }
    }
}

struct CustomLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoaderView()
    }
}
