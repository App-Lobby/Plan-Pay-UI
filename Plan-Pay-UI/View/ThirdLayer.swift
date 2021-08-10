//
//  ThirdLayer.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI


struct ThirdLayer: View {
    
    @ObservedObject var pricingVM : PricingViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment:.leading){
                HStack {
                    VStack(alignment:.leading , spacing : 10) {
                        Text("where should we send the money?")
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 22))
                        Text("amount will be credited to this bank account, EMI will also be debited from this bank accout")
                            .foregroundColor(Color(#colorLiteral(red: 0.6972800186, green: 0.6972800186, blue: 0.6972800186, alpha: 1)))
                            .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 14))
                    }
                    Spacer()
                }
                .padding(.top , 20)
                .padding(.leading , 24)
                
                
                
                
                HStack {
                    HStack(spacing : 16){
                        Image("paytm")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40, alignment: .center)
                            .cornerRadius(10)
                        
                        VStack (alignment:.leading , spacing : 3){
                            Text("Paytm Payment Banks")
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 16))
                            Text("05904095048")
                                .foregroundColor(Color(#colorLiteral(red: 0.5839507113, green: 0.5839507113, blue: 0.5839507113, alpha: 1)))
                                .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 12))
                        }
                        
                    }
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 26))
                            .foregroundColor(Color(#colorLiteral(red: 0.6228426904, green: 0.6228426904, blue: 0.6228426904, alpha: 1)))
                        Image(systemName: "checkmark")
                            .font(.system(size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                }
                .padding(.horizontal , 24)
                .padding(.top , 30)
                
                
                VStack{
                    Text("Change account")
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                }
                .frame(width : 150 , height : 40)
                .background(
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                )
                .padding(.leading , 24)
                .padding(.top , 24)
                
                Spacer()
                
                BottomButtonView(title: "Tap for 1-click KYC")
                
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.55, alignment: .center)
            .background(RoundedCorners(color: Color(#colorLiteral(red: 0.1122442707, green: 0.1507993937, blue: 0.1916652918, alpha: 1)), tl: 20, tr: 20, bl: 0, br: 0))
            .gesture(
                DragGesture().onChanged { value in
                    pricingVM.x = value.location.x
                    if pricingVM.x < 230 {
                        withAnimation(Animation.interpolatingSpring(stiffness: 3, damping: 1.5).speed(4)) {
                            pricingVM.arrowOffsetx = -30
                        }
                    } else {
                        // Mark:- Don't Show Arrow
                    }
                }
                .onEnded { value in
                    DispatchQueue.main.asyncAfter(deadline:.now() + 0.4) {
                        withAnimation(Animation.linear.speed(4)) {
                            pricingVM.arrowOffsetx = 50
                        }
                    }
                    if pricingVM.x < 230 {
                        if pricingVM.showThirdLayer {
                            pricingVM.showLoader = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(Animation.linear.speed(1)){
                                    pricingVM.showThirdLayer = false
                                    pricingVM.showLoader = false
                                }
                            }
                        }
                    }
                }
            )
        }
    }
}

