//
//  AddSaleView.swift
//  AgniPrime
//
//  Created by MAC on 29/03/22.
//

import SwiftUI



struct AddSaleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var name: String = ""
    @State var mobileNumber: String = ""
    @State var aadhaarNumber: String = ""
    @State var doorNo: String = ""
    @State var streetName: String = ""
    @State var areaName: String = ""
    @State var cityName: String = ""
    @State var stateName: String = ""
    @State var pinCode: String = ""
    @State var chooseBirthDay: String = ""
    @State var chooseAnniversary: String = ""
    @State var enrollMentNumber: String = ""
    @State var emailId : String = ""

    @State var chooseType : String = ""
    
    @State var newSelected = true
    @State var existingClick : Bool = false
    @State var masonClick : Bool = false
    @State var barbendorClick : Bool = false
    @State var EngineerClick : Bool = false
    @State private var birthDate = Date()

    @State var enrollMentNumberGet : String?
    
    @ObservedObject var viewModel = CustomerViewModel()
    @State var presentGraph  = false
    @State var chooseBirthdayDate : Date? = nil
    @State var chooseAnniversaryClick : Date? = nil
    @State var clickBirthdayDate : Bool = false
    @State var clickAnniversaryDate : Bool = false
    @State var errorPoupShow : Bool? = false
    @State var errorMsg : String = ""
    @State var showLoader : Bool = false
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
            ScrollView{
             
                VStack(alignment: .leading){
                    ZStack{
                        Text("Add Sale")
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
                   
     
                    VStack(alignment : .leading){
                        Text("Choose Customer Type")
                            .font(.system(size: 17, weight: .semibold))
                            .padding([.bottom],10)
                                .padding([.leading, .trailing],22)
                        HStack(spacing : 50){
                            Button {
                                newSelected = true
                               existingClick = false
                               
                            } label: {
                                HStack{
                                    Image(systemName: newSelected ? "circle.circle.fill" : "circle")
                                .resizable()
                                .foregroundColor(.black)
                                        .frame(width: 15, height: 15)
                                    Text("New")
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Button {
                                existingClick = true
                                newSelected = false
                            } label: {
                                HStack{
                                    Image(systemName: existingClick ? "circle.circle.fill" : "circle")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .frame(width: 15, height: 15)
                                    Text("Existing")
                                        .foregroundColor(.black)

                                }
                            }

                        }.padding([.bottom],10)
                            .padding([.leading,.trailing,],22)


                    }
                    if existingClick{
                        VStack{
                            HStack{
                                HStack {
                                    Image(systemName: "phone.fill")
                                        .foregroundColor(.black)
                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 4))
                                    TextField("Enrollment Number",
                                              text: $enrollMentNumber)
                                    .padding(EdgeInsets(top: 3, leading: 1, bottom: 4, trailing: 15))
                                }
                                .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                                    .padding(EdgeInsets(top: 3, leading: 15, bottom: 4, trailing: 15))
                                Button {
                                    viewModel.enrollmentNumberGetApi(enrollMentNumber: enrollMentNumber)
                                } label: {
                                    Text("Find")
                                        .foregroundColor(.black)
                                    
                                }
                                .frame(width: 100, height: 60)                            .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(10)
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 15))
                            }
                            List((viewModel.customerValueGetData ?? []), id : \.self){ item in
                                Button{
                                //    addBirthdayPopUp = true
                                    print(item)
                                }label:{
                                    CustomerListCell(saleModeButton : "Add this customer", getSalesValueData: item,selctedButtonRow: .constant(""), saleOrderRow: $enrollMentNumberGet,showToast: $errorPoupShow , errorMsgs : $errorMsg, loaderCreatred :$showLoader)
                                }
                                
                            }
                            .frame(height: geometry.size.height)
                           
                        }
                    }else{
                    VStack{
                            VStack(alignment : .leading){
                                Text("Choose Type")
                                    .font(.system(size: 17, weight: .semibold))
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 4))
                        HStack(spacing : 30){
                            Button {
                                masonClick = true
                                barbendorClick = false
                                EngineerClick = false
                                chooseType = "Mason"
                            } label: {
                                HStack{
                                    Image(systemName: masonClick ? "circle.circle.fill" : "circle")
                                .resizable()
                                .foregroundColor(.black)
                                        .frame(width: 15, height: 15)
                                    Text("Mason")
                                        .foregroundColor(.black)
                                }
                            }
                            Button {
                                barbendorClick = true
                                masonClick = false
                                EngineerClick = false
                                chooseType = "Barbendor"

                            } label: {
                                HStack{
                                    Image(systemName: barbendorClick ? "circle.circle.fill" : "circle")
                                .resizable()
                                .foregroundColor(.black)
                                        .frame(width: 15, height: 15)
                                    Text("Barbendor")
                                        .foregroundColor(.black)
                                }
                            }
                            Button {
                                EngineerClick = true
                                masonClick = false
                                barbendorClick = false
                                
                                chooseType = "Engineer"
                            } label: {
                                HStack{
                                    Image(systemName: EngineerClick ? "circle.circle.fill" : "circle")
                                      //  .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.black)
                                       // .frame(width: 15, height: 15)
                                    Text("Engineer")
                                        .foregroundColor(.black)

                                }
                            }

                        }  .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 4))
                        }
                      
                        AddSaleTextFieldView(textContent: $name, placeHolder: "Name",image: "person.fill")
                        AddSaleTextFieldView(textContent: $mobileNumber, placeHolder: "Mobile Number",image: "phone.fill",keyBoardTypeValueGet: 0)
                        AddSaleTextFieldView(textContent: $aadhaarNumber, placeHolder: "Aadhaar Number",image: "person.fill" ,keyBoardTypeValueGet: 0)
                      //  AddSaleTextFieldView(textContent: $emailId, placeHolder: "Email ",image: "person.fill")
                        AddSaleTextFieldView(textContent: $doorNo, placeHolder: "Door No",image: "location.fill")
                        AddSaleTextFieldView(textContent: $streetName, placeHolder: "Street Name",image: "location.fill")
                        AddSaleTextFieldView(textContent: $areaName, placeHolder: "Area Name",image: "location.fill")
                        AddSaleTextFieldView(textContent: $cityName, placeHolder: "City Name",image: "location.fill")
                       
                       
                        VStack{
                            AddSaleTextFieldView(textContent: $stateName, placeHolder: "State Name",image: "location.fill")
                            AddSaleTextFieldView(textContent: $pinCode, placeHolder: "Pin Code",image: "location.fill" ,keyBoardTypeValueGet: 0)
                            Button{
                              

                            } label : {
                                HStack {
//                                    Image(systemName: "calendar")
//                                        .foregroundColor(.black)
//                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 4))
//                                    TextField("Choose Anniversary",
//                                              text: $chooseAnniversary)
//                                   // .frame(alignment: .leading)
//                                    .padding(EdgeInsets(top: 3, leading: 1, bottom: 4, trailing: 15))
                                    
                                    VStack{
                                        Button{
                                           clickBirthdayDate = true
                                        } label: {
                                            VStack{
                                                if chooseBirthdayDate != nil{
                                                  
                                                    Text("Date of Birth : " + changeDateFormatte(date: chooseBirthdayDate ?? Date()))
                                                        .foregroundColor(.black)
                                                }else{
                                                    Text("Choose Date of Birth ")
                                                        .foregroundColor(.gray)
                                                }
                                             
//                                                     Divider()
//
//                                                         .background(Color.black)
                                            }
                                        }

                                
                                }
                                    
                                }
                                .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                                    .padding(EdgeInsets(top: 3, leading: 15, bottom: 4, trailing: 15))
                            }
                            VStack{
                                Button{
                                    clickAnniversaryDate = true
                                }label: {
                                    VStack{
                            if chooseAnniversaryClick != nil{
                              
                                Text("Choose Anniversary Date : " + changeDateFormatte(date: chooseAnniversaryClick ?? Date()))
                                    .foregroundColor(.black)
                            }else{
                                Text("Choose Anniversary Date ")
                                    .foregroundColor(.gray)
                            }
                         
                              //   Divider()
                                     
                                   //  .background(Color.black)
                                    }
                            }
                        } .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                                    .padding(EdgeInsets(top: 3, leading: 15, bottom: 4, trailing: 15))
                      //  }
                          //  AddSaleTextFieldView(textContent: $chooseBirthDay, placeHolder: "Choose Birthday",image: "calendar")
                           
                         //   AddSaleTextFieldView(textContent: chooseAnniversary, placeHolder: "Choose Anniversary",image: "calendar")
                            Button {
                                if chooseType == "" {
                                    errorMsg = "Please Select Type"
                                    errorPoupShow = true
                                    
                                }else if name == ""{
                                            errorMsg = "Please enter Name"
                                            errorPoupShow = true
                                }else if mobileNumber.count <= 9 || mobileNumber.count > 11{
                                    errorMsg = "Please enter Valid Phone Number"
                                    errorPoupShow = true
                                }else if aadhaarNumber.count <= 11 || aadhaarNumber.count > 13{
                                    errorMsg = "Please enter valid Adhaar Number"
                                    errorPoupShow = true
                                }else if doorNo == ""{
                                    errorMsg = "Please enter Door No"
                                    errorPoupShow = true
                                }else if streetName == ""{
                                    errorMsg = "Please enter Street name"
                                    errorPoupShow = true
                                }else if areaName == ""{
                                    errorMsg = "Please enter Area Name"
                                    errorPoupShow = true
                                }else if cityName == ""{
                                    errorMsg = "Please enter City Name"
                                    errorPoupShow = true
                                }else if stateName == ""{
                                    errorMsg = "Please enter State Name"
                                    errorPoupShow = true
                                }else if pinCode.count <= 5 || pinCode.count > 7{
                                    errorMsg = "Please enter Valid PinCode"
                                    errorPoupShow = true
                             
                                }else{
                                    showLoader = true
                                    viewModel.addNewCustomerApi(name: name.removeWhitespace(), mobileNumber: mobileNumber.removingWhitespace(), adhaarNumber: aadhaarNumber.removingWhitespace(), doorNo: doorNo.removingWhitespace(), streetName: streetName.removingWhitespace(), areaName: areaName.removingWhitespace(), cityName: cityName.removingWhitespace(), stateName: stateName.removingWhitespace(), pincode: pinCode.removingWhitespace(), chooseAnniversary: changeDateFormatte(date: chooseAnniversaryClick ?? Date()), chooseBirthday: changeDateFormatte(date: chooseBirthdayDate ?? Date()),email: "\(doorNo.removingWhitespace()),\(streetName.removingWhitespace()),\(areaName.removingWhitespace()),\(cityName.removingWhitespace()),\(stateName.removingWhitespace()),\( pinCode.removingWhitespace())",chooseType : chooseType, completionHandler: ({ result in
                                    if result != nil{
                                        showLoader = false
                                       errorPoupShow = true
                                        errorMsg = result?.msg ?? ""
                                        
                                    }else{
                                        errorPoupShow = true
                                         errorMsg = "Add customer Sucessfully"
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                            showLoader = false
                                            presentationMode.wrappedValue.dismiss()

                                        }
                                    }
                                }))
                                    }
                                print(name)
                            } label: {
                                Text("Submit")
                                    .foregroundColor(.black)
                                
                            }
                            .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                            .background(Color.init(Constants.Color.yellowColor))
                            .cornerRadius(10)
                            .padding([.leading, .bottom, .trailing], 15.0)
                        
                        }
                        
                        
                    }
                    .frame(width: geometry.size.width)
                    .padding([.bottom],50)
                }
                        
                    }
               
           // }
        
            }
                
            .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                if clickBirthdayDate{
                    DatePickerWithButtons(showDatePicker: $clickBirthdayDate, savedDate: $chooseBirthdayDate, selectedDate: chooseBirthdayDate ?? Date())
                        .animation(.linear)
                        .transition(.opacity)
                 }
                 if clickAnniversaryDate{
                     DatePickerWithButtons(showDatePicker: $clickAnniversaryDate, savedDate: $chooseAnniversaryClick, selectedDate: chooseAnniversaryClick ?? Date())
                         .animation(.linear)
                         .transition(.opacity)
                 }
        
            }
            .toast(isShowing: $errorPoupShow , duration: 4.0 ,textContent: errorMsg)
            .loaderView(isShowing: $showLoader)
        }
    }
func changeDateFormatte(date : Date) -> String{
    let dateFormatter = DateFormatter()

    // Set Date Format
    dateFormatter.dateFormat = "YY-MM-dd"
    let finalDate  = dateFormatter.string(from: date )
    return finalDate.removeWhitespace()
}
}

struct AddSaleView_Previews: PreviewProvider {
    static var previews: some View {
        AddSaleView()
    }
}
