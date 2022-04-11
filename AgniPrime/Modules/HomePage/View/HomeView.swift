//
//  HomeView.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import SwiftUI

struct HomeMainModel: Identifiable,Hashable , Codable {
    var id = UUID()
    let tittle , Image : String
}


struct HomeView: View {
    
    // Show Grid Value
    let HomeModel: [HomeMainModel] = [
        HomeMainModel( tittle: "Payment", Image: "paymentIcon"),
        HomeMainModel( tittle: "Orders", Image: "ordersIcon"),
        HomeMainModel( tittle: "SaleEntry", Image: "saleEntryIcon"),
        HomeMainModel(tittle: "Project", Image: "projectIcon"),
        HomeMainModel(tittle: "Voucher", Image: "voucherIcon"),
        HomeMainModel(tittle: "Customers", Image: "customersIcon")
    ]
    
    @State var logOutClicked : Bool = false
    
    var body: some View {
        GeometryReader{ _ in
            
            ScrollView{
                VStack(alignment: .center){
                    VStack(spacing : 40){
                        //   HeaderView
                        HStack{
                            Spacer()
                            Text(StorageManager.sharedInstance.getUserName() ?? "")
                                .padding()
                            Button{
                               StorageManager.sharedInstance.removeLogoutDatas()
                                logOutClicked = true
                            } label: {
                                Image("LogOut")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .padding()
                            }
                         
                        }
                        .frame(maxWidth: .infinity, minHeight :60, maxHeight: 60)
                        .background(Color.init(Constants.Color.yellowColor))
                        
                        Image("LoginPage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.width/1.5)
                            .padding(.horizontal, 30.0)
                        
                        //Main Page
                        
                        VStack {
                            HStack {
                                
                                NavigationLink{
                                    PaymentCreditView()
                                }label: {
                                    
                                    HomeCollectionCell(getValues: HomeModel[0])
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.8, alignment: .center)
                                .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(8)
                                //         .padding()
                                .padding([.leading],10.0)
                                .padding([.bottom])
                                NavigationLink{
                                    OrdersView(headerName : "ORDERS")
                                }label: {
                                    
                                    HomeCollectionCell(getValues: HomeModel[1])
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.8, alignment: .center)
                                .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(8)
                                //         .padding()
                                .padding([.leading],10.0)
                                .padding([.bottom])
                                }
                            HStack {
                                NavigationLink{
                                    SalesView()
                                }label: {
                                    HomeCollectionCell(getValues: HomeModel[2])
                                }
                                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.8, alignment: .center)
                                .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(8)
                                //         .padding()
                                .padding([.leading],10.0)
                                .padding([.bottom])
                                NavigationLink{
                                    OrdersView(headerName : "PROECTS")
                                }label: {
                                    HomeCollectionCell(getValues: HomeModel[3])
                                }
                                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.8, alignment: .center)
                                .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(8)
                                //         .padding()
                                .padding([.leading],10.0)
                                .padding([.bottom])
                                
                                //    .cornerRadius(20)
                            }
                            HStack {
                                
                                NavigationLink{
                                    RewardsView()
                                }label: {
                                    
                                    HomeCollectionCell(getValues: HomeModel[4])
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.8, alignment: .center)
                                .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(8)
                                //         .padding()
                                .padding([.leading],10.0)
                                .padding([.bottom])
                                NavigationLink{
                                    CustomerView()
                                }label: {
                                    HomeCollectionCell(getValues: HomeModel[5])
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.width/2.8, alignment: .center)
                                .background(Color.init(Constants.Color.yellowColor))
                                .cornerRadius(8)
                                .padding([.leading],10.0)
                                .padding([.bottom])
                                
                            }
                        }
                        
                        
                    }
                }
            }//.ignoresSafeArea()
            .navigationBarHidden(true)
            .background(
                NavigationLink(destination: LoginView(), isActive: $logOutClicked) {
                   // LoginView()
                }
                    .hidden()
            )
        }
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
