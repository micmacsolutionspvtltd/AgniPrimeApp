//
//  CustomToastView.swift
//  AgniPrime
//
//  Created by MAC on 06/04/22.
//

import Foundation
import SwiftUI


struct ToastModifier : ViewModifier{
    @Binding var isShowing : Bool?
    let textContentValue : String
    let duration : TimeInterval
    func body(content: Content) -> some View {
        ZStack{
            content
            if isShowing ?? false{
                VStack{
                    Spacer()
                    HStack{
                        Text(textContentValue)
                            .foregroundColor(.black)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.init(Constants.Color.yellowColor))
                    .cornerRadius(.infinity)
                    
                }.padding()
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation{
                                isShowing = false
                            }
                        }
                    }
            }
         
             
        }
    }
}

extension View{
    func toast(isShowing : Binding<Bool?> , duration : TimeInterval = 2.0 , textContent : String = "Something Went Wrong") -> some View{
        modifier(ToastModifier(isShowing: isShowing, textContentValue : textContent, duration: duration))
    }
}


struct LoadModifier : ViewModifier{
    @Binding var isShowing : Bool
//    let textContentValue : String
//    let duration : TimeInterval
    func body(content: Content) -> some View {
        ZStack{
            content
            if isShowing{
         //       VStack{
                    ZStack{
                        if #available(iOS 14.0, *) {
                            Color(.systemBackground)
                                .ignoresSafeArea()
                                .opacity(0.3)
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .red))
                                .scaleEffect(5)
                        } else {
                            // Fallback on earlier versions
                        }
                    
                }.padding()
                    .onAppear(){
//                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//                            withAnimation{
//                                isShowing = false
//                            }
//                        }
                    }
         //   }
            }
             
        }
    }
}

extension View{
    func loaderView(isShowing : Binding<Bool> ) -> some View{
        modifier(LoadModifier(isShowing: isShowing))
    }
}

struct ListSeparatorStyle: ViewModifier {
    
    let style: UITableViewCell.SeparatorStyle
    
    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITableView.appearance().separatorStyle = self.style
            }
    }
}
 
extension View {
    
    func listSeparatorStyle(style: UITableViewCell.SeparatorStyle) -> some View {
        ModifiedContent(content: self, modifier: ListSeparatorStyle(style: style))
    }
}
