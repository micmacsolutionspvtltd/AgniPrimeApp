//
//  ViewBirthdayView.swift
//  AgniPrime
//
//  Created by MAC on 04/04/22.
//

import SwiftUI

struct ViewBirthdayView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var docId : String = ""
    @State var customerValueGetData : [ViewBirthdayModelElement]? = []
    @ObservedObject var viewModel = CustomerViewModel()
    @State var showLoader : Bool = true
    @State var errorPoupShow : Bool? = false

    var body: some View {
        GeometryReader{ geoMetry in
            ZStack{
                VStack(alignment: .center, spacing : 2){
                    ZStack{
                        Text("BirthDays")
                            .fontWeight(.semibold)
                            .padding()
                        HStack{
                            
                            Button {
                                   presentationMode.wrappedValue.dismiss()
                                
                            } label: {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                    .padding()
                            }
                            Spacer()
                        }
                        
                    }
                    .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                    
                    .background(Color.init(Constants.Color.yellowColor))
                    List(customerValueGetData ?? [] , id :\.self){ (value) in
                        ViewBirthdayCell(getAllbirthdayValues: value)
                            .frame( height: 70)
                        
                    }
                }
            }
        }.navigationBarHidden(true)
        .onAppear(){
            showLoader = true
            viewModel.getViewBirthdayApi(docId: docId) { (response) in
                if response?.count == 0{
                    errorPoupShow = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        showLoader = false
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    
                }else{
                    customerValueGetData = response
                    showLoader = false
                }
              
            }
        }
        .toast(isShowing: $errorPoupShow , duration: 3.0 ,textContent: "No birthday Found Please Add")
        .loaderView(isShowing: $showLoader)

        
    }
}

struct ViewBirthdayView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBirthdayView()
         //   .background(Color.black)
        
    }
}
