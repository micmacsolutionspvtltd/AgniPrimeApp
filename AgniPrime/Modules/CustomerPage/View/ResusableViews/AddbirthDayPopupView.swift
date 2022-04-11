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

struct DatePickerWithButtons: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                if #available(iOS 14.0, *) {
                    DatePicker("Test", selection: $selectedDate, in: ...Date() , displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                } else {
                    DatePicker("Test", selection: $selectedDate , displayedComponents: [.date])
                    // Fallback on earlier versions
                }
                
                Divider()
                HStack {
                    
                    Button(action: {
                        showDatePicker = false
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        savedDate = selectedDate
                        showDatePicker = false
                    }, label: {
                        Text("Save".uppercased())
                            .bold()
                    })
                    
                }
                .padding(.horizontal)

            }
            .padding()
            .background(
                Color.white
                    .cornerRadius(30)
            )

            
        }

    }
}



struct DatePickerWithButtons_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerWithButtons(showDatePicker: .constant(false), savedDate: .constant(Date()))
    }
}

