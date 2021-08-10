//
//  SecondLayer.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct SecondLayer: View {
    @ObservedObject var pricingVM : PricingViewModel
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment:.leading){
                if !pricingVM.showThirdLayer {
                    HStack {
                        VStack(alignment:.leading , spacing : 10){
                            Text("how do you wish to repay?")
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                            Text("choose one of our recommended plans or make your own")
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                .font(.system(size: 14, weight: .thin, design: .rounded))
                        }
                        Spacer()
                    }
                    .padding(.top , 30)
                    .padding(.leading , 24)
                    .padding(.trailing , 40)
                } else {
                    HStack {
                        VStack(alignment:.leading){
                            Text("EMI")
                                .foregroundColor(Color(#colorLiteral(red: 0.5903142555, green: 0.5903142555, blue: 0.5903142555, alpha: 1)))
                                .font(.system(size : 12))
                            HStack {
                                Text("\(pricingVM.pricelist[pricingVM.selectedPlanIndex].amount)")
                                    .foregroundColor(Color(#colorLiteral(red: 0.5903142555, green: 0.5903142555, blue: 0.5903142555, alpha: 1)))
                                    .font(.system(size : 18))
                                Text("/mo")
                                    .foregroundColor(Color(#colorLiteral(red: 0.5903142555, green: 0.5903142555, blue: 0.5903142555, alpha: 1)))
                                    .font(.system(size : 14))
                            }
                        }
                        Spacer()
                        VStack(alignment:.leading){
                            Text("duration")
                                .foregroundColor(Color(#colorLiteral(red: 0.5903142555, green: 0.5903142555, blue: 0.5903142555, alpha: 1)))
                                .font(.system(size : 12))
                            Text("\(pricingVM.pricelist[pricingVM.selectedPlanIndex].duration) months")
                                .foregroundColor(Color(#colorLiteral(red: 0.5903142555, green: 0.5903142555, blue: 0.5903142555, alpha: 1)))
                                .font(.system(size : 18))
                        }
                        Spacer()
                        Image(systemName: "chevron.backward")
                            .rotationEffect(.degrees(-90))
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .font(.system(size: 18))
                        
                    }
                    .padding(.top , 20)
                    .padding(.horizontal , 24)
                }
                
                
                if !pricingVM.showThirdLayer {
                    ScrollView(.horizontal , showsIndicators: false) {
                        HStack(spacing : 20){
                            ForEach(pricingVM.pricelist.indices , id: \.self) { i in
                                let index = pricingVM.pricelist[i]
                                ZStack (alignment:.top){
                                    HStack {
                                        VStack(alignment:.leading){
                                            ZStack {
                                                
                                                if index.selected {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .foregroundColor(Color(#colorLiteral(red: 0.5627590061, green: 0.4401064022, blue: 0.4974924626, alpha: 1)))
                                                        .frame(width: 30, height: 30, alignment: .center)
                                                } else {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                                        .frame(width: 30, height: 30, alignment: .center)
                                                }
                                                
                                                if index.selected {
                                                    Image(systemName: "checkmark")
                                                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                                        .font(.system(size: 15, weight: .bold, design: .rounded))
                                                }
                                                
                                            }
                                            .padding(.top , 10)
                                            
                                            HStack {
                                                HStack(spacing : 2){
                                                    Text("₹")
                                                        .font(.system(size: 18, weight: .medium, design: .rounded))
                                                    Text("\(index.amount)")
                                                        .font(.custom(MyFonts.SFUITextBold.rawValue , size : 18))
                                                    
                                                }
                                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                                Text("/mo")
                                                    .foregroundColor(Color(#colorLiteral(red: 0.6140757782, green: 0.649164888, blue: 0.6119449696, alpha: 1)))
                                                    .font(.custom(MyFonts.SFUITextBold.rawValue , size : 14))
                                            }
                                            .padding(.top , 14)
                                            
                                            Text("for \(index.duration) months")
                                                .foregroundColor(Color(#colorLiteral(red: 0.8235725324, green: 0.8235725324, blue: 0.8235725324, alpha: 1)))
                                                .font(.custom(MyFonts.SFUITextRegular.rawValue , size : 14))
                                            
                                            Button(action: {}, label: {
                                                Text("See calculations")
                                                    .foregroundColor(Color(#colorLiteral(red: 0.7795698028, green: 0.7795698028, blue: 0.7795698028, alpha: 1)))
                                                    .font(.custom(MyFonts.SFUITextRegular.rawValue , size : 14))
                                                    .padding(.top , 14)
                                            })
                                        }
                                        Spacer()
                                    }
                                    .padding(.leading , 24)
                                    .frame(width : UIScreen.main.bounds.width / 2 , height: UIScreen.main.bounds.height / 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(index.color)
                                    )
                                    .padding(.top , 10)
                                    .onTapGesture {
                                        pricingVM.selectingPaln(index : i)
                                    }
                                    
                                    if index.recomended {
                                        Text("recomended")
                                            .font(.custom(MyFonts.SFUITextRegularG1.rawValue , size : 14))
                                            .padding(.horizontal , 18)
                                            .padding(.vertical , 4)
                                            .background(
                                                RoundedRectangle(cornerRadius : 24)
                                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            )
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    .padding(.top, 30)
                    .padding(.leading , 24)
                }
                
                
                if !pricingVM.showThirdLayer {
                    VStack{
                        Text("Create your own plan")
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .font(.custom(MyFonts.SFUITextBold.rawValue , size : 12))
                    }
                    .frame(width : 160 , height : 30)
                    .background(
                        RoundedRectangle(cornerRadius: 22.0)
                            .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    )
                    .padding(.leading , 24)
                    .padding(.top , 24)
                }
                
                Spacer()
                
                if !pricingVM.showThirdLayer {
                    Button(action: {
                        pricingVM.checkForPlanSelection()
                        if pricingVM.isPlanSelected {
                            pricingVM.showLoader = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(Animation.linear.speed(0.9)){
                                    pricingVM.showThirdLayer = true
                                    pricingVM.showLoader = false
                                }
                            }
                        }
                        
                        
                    }, label: {
                        BottomButtonView(title: "Select your bank account")
                    })
                }
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.3, alignment: .center)
            .background(RoundedCorners(color: Color(#colorLiteral(red: 0.07724516839, green: 0.1153302565, blue: 0.152833581, alpha: 1)), tl: 20, tr: 20, bl: 0, br: 0))
            .onTapGesture {
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
                        if pricingVM.showSecondLayer {
                            pricingVM.showLoader = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(Animation.linear.speed(1)){
                                    pricingVM.showSecondLayer = false
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

