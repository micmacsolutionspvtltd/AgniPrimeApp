//
//  ContentView.swift
//  AgniPrime
//
//  Created by MAC on 25/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var mobileNumber: String = ""

    var body: some View {
        GeometryReader{ gp in
            NavigationView{
            ScrollView{
                ZStack(){
                    VStack(spacing : 50){
                    Image("LoginPage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 30.0)
       
                VStack(alignment: .center){
                    TextField("Enter Mobile Number", text: $mobileNumber)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                                             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                        .padding()
                        

                     
                    NavigationLink {
                      //  OtpView(viewModel: ContentViewModel())
                    } label: {
                        Text("Submit")
                    .foregroundColor(.black)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                    .background(Color.init(Constants.Color.yellowColor))
                    .cornerRadius(10)
                    .padding([.leading, .bottom, .trailing], 15.0)
                }
          Spacer()
                }
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
               .position(x: gp.size.width / 2, y: gp.size.height / 2)
                                  

                }
            }.navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
