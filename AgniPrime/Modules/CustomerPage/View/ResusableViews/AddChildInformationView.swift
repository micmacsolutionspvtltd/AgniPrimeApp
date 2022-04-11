//
//  AddChildInformationView.swift
//  AgniPrime
//
//  Created by MAC on 05/04/22.
//

import SwiftUI

struct AddChildInformationView: View {
    @State var chooseType : String = ""
    @State var docId : String?

    @State var sonClick : Bool = false
    @State var daughterClick : Bool = false
    @State var motherClick : Bool = false
    @State var fatherClick : Bool = false
    @State var wifeClick : Bool = false
    @State var husbandClick : Bool = false
    @State var enterName: String = ""
    @State var selectDate: Date? = nil

    @State var calendarClicked = false
    @ObservedObject var viewModel = CustomerViewModel()
    @State var showDatePicker: Bool = false
    @Binding var clickAddBirthdayClicked : Bool?
    @EnvironmentObject var customViewModel: MainViewModelFile


    @Binding var errorPoupShowed : Bool?
    @Binding var errorMsg : String?


    var body: some View {
        ZStack{
        VStack(spacing: 20){
          Text("Add Birthaday")
                .fontWeight(.semibold)
                .frame(width: 340,height : 60)
              //  .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                .background(Color.init(Constants.Color.yellowColor))
            VStack(alignment : .leading){
                Text("Choose Type")
                    .font(.system(size: 17, weight: .semibold))
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 4))
        HStack(spacing : 20){
            Button {
                unClickAll()
                sonClick = true
              
                chooseType = "Son"
            } label: {
                HStack{
                    Image(systemName: sonClick ? "circle.circle.fill" : "circle")
                .resizable()
                .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                    Text("Son")
                        .foregroundColor(.black)
                }
            }
            Button {
                unClickAll()
                daughterClick = true
              
                chooseType = "Daughter"

            } label: {
                HStack{
                    Image(systemName: daughterClick ? "circle.circle.fill" : "circle")
                .resizable()
                .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                    Text("Daughter")
                        .foregroundColor(.black)
                }
            }
            Button {
                unClickAll()
                motherClick = true
                chooseType = "Mother"
            } label: {
                HStack{
                    Image(systemName: motherClick ? "circle.circle.fill" : "circle")
                      //  .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                       // .frame(width: 15, height: 15)
                    Text("Mother")
                        .foregroundColor(.black)

                }
            }

        }  .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                HStack(spacing : 20){
                    Button {
                       unClickAll()
                        fatherClick = true
                        chooseType = "Father"
                    } label: {
                        HStack{
                            Image(systemName: fatherClick ? "circle.circle.fill" : "circle")
                        .resizable()
                        .foregroundColor(.black)
                                .frame(width: 15, height: 15)
                            Text("Father")
                                .foregroundColor(.black)
                        }
                    }
                    Button {
                        unClickAll()
                         wifeClick = true
                         chooseType = "Wife"

                    } label: {
                        HStack{
                            Image(systemName: wifeClick ? "circle.circle.fill" : "circle")
                        .resizable()
                        .foregroundColor(.black)
                                .frame(width: 15, height: 15)
                            Text("Wife")
                                .foregroundColor(.black)
                        }
                    }
                    Button {
                        unClickAll()
                         husbandClick = true
                         chooseType = "Husband"
                    } label: {
                        HStack{
                            Image(systemName: husbandClick ? "circle.circle.fill" : "circle")
                              //  .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                               // .frame(width: 15, height: 15)
                            Text("Husband")
                                .foregroundColor(.black)

                        }
                    }

                }  .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                VStack{
                    TextField("Name", text: $enterName)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .multilineTextAlignment(.center)
                        .frame(width: 300,alignment: .center)
                        
                       
                    Divider()
                        
                        .background(Color.black)
                    
                }
                .frame(width: 340)
                VStack{

                    Button{
                        showDatePicker = true
                    }label: {
                        VStack{
                            if selectDate != nil{
                              
                                Text("Date of Birth : " + changeDateFormatte(date: selectDate ?? Date()))
                                    .foregroundColor(.black)
                            }else{
                                Text("Date of Birth")
                                    .foregroundColor(.gray)

                            }
                         
                                 Divider()
                                     
                                     .background(Color.black)
                        }
                       
                    }
                        .frame(width: 280)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                   
                    
                }.frame(width: 340)
                HStack(spacing : 40){
                    Button {
                        clickAddBirthdayClicked = false
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                            .frame(width: 130)
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(8)

                    }
                    Button {
                       
                        if chooseType == ""{
                        errorMsg = "Please Select Relation Type"
                            errorPoupShowed = true
                        }else if enterName == ""{
                            errorMsg = "Please Enter Name"
                                errorPoupShowed = true
                        }else if selectDate == nil{
                            errorMsg = "Please Select Date of birth"
                                errorPoupShowed = true
                        }else{
                        // Create Date Formatter
                        let dateFormatter = DateFormatter()

                        // Set Date Format
                        dateFormatter.dateFormat = "YY-MM-dd"
                        let finalDate  =   dateFormatter.string(from: selectDate ?? Date())
                            viewModel.addNewBirthdayApi( birthday: finalDate, relation: chooseType, documentId: docId ?? "", name: enterName.removingWhitespace()) { result in
                            if result != nil{
                                if result?.status == "true"{
                                   clickAddBirthdayClicked = false
                                    customViewModel.showPopUpValue = false
                                }else{
                                    
                                }
                            }
                        }
                    }
                       
                    } label: {
                        Text("Add")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                            .frame(width: 130)
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(8)
         
                    }
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                .frame(width: 340)
                //.frame( alignment: .center)
        }
        }
    }
        if showDatePicker {
                        DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $selectDate, selectedDate: selectDate ?? Date())
                            .animation(.linear)
                            .transition(.opacity)
                    }
    }
  
    func unClickAll(){
        sonClick = false
        motherClick = false
        daughterClick = false
        husbandClick = false
        wifeClick = false
        fatherClick = false
    }
    func changeDateFormatte(date : Date) -> String{
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY-MM-dd"
        let finalDate  = dateFormatter.string(from: selectDate ?? Date())
        return finalDate
    }
}

struct AddChildInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AddChildInformationView( clickAddBirthdayClicked: .constant(false),errorPoupShowed : .constant(false) , errorMsg:  .constant(""))
            .previewLayout(.fixed(width: 340, height: 370))

    }
}
