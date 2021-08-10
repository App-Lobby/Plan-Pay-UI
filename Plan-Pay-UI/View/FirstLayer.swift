//
//  FirstLayer.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct FirstLayer: View {
    @State private var size = UIScreen.main.bounds.width - 150
    @ObservedObject var pricingVM : PricingViewModel
    var body: some View {
        VStack {
            Spacer()
            VStack {
                if !pricingVM.showSecondLayer {
                    FirstLayerTopView()
                } else {
                    FirstLayerInfoView(pricingVM: pricingVM)
                }
                Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 1.7, alignment: .center)
                        
                        VStack {
                            ZStack {
                                Circle()
                                    .stroke(Color(#colorLiteral(red: 0.9254902005, green: 0.7483854285, blue: 0.6205973634, alpha: 1)),style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                                    .frame(width: size, height: size)
                                
                                Circle()
                                    .trim(from: 0, to: pricingVM.selectedAmount)
                                    .stroke(Color(#colorLiteral(red: 0.5667869332, green: 0.3998894944, blue: 0.03469801158, alpha: 1)),style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                                    .frame(width: size, height: size)
                                    .rotationEffect(.init(degrees: -90))
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .foregroundColor(Color(#colorLiteral(red: 0.8710189505, green: 0.7076001527, blue: 0.5863175001, alpha: 1)))
                                    
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .foregroundColor(Color(#colorLiteral(red: 0.0957373393, green: 0.0957373393, blue: 0.0957373393, alpha: 1)))
                                        .frame(width: 32, height: 32, alignment: .center)
                                    
                                }
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .offset(x: size / 2)
                                .rotationEffect(.init(degrees: pricingVM.angle))
                                .gesture(DragGesture().onChanged(pricingVM.onDrag(value:)))
                                .rotationEffect(.init(degrees: -90))
                                
                                VStack {
                                    Text("credit amount")
                                        .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 12))

                                    HStack(spacing:2) {
                                        Text("₹")
                                            .font(.system(size: 18, weight: .medium, design: .serif))
                                        Text("\(Int(pricingVM.selectedAmount * 20000))")
                                            .font(.custom(MyFonts.SFUITextRegularG3.rawValue , size:24))
                                    }
                                    
                                    Line()
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                                        .frame(height: 1)
                                        .frame(width : 80 , height : 1)
                                        .padding(.top , -8)
                                    
                                    
                                    Text("1.04% monthly")
                                        .foregroundColor(Color(#colorLiteral(red: 0.3142935898, green: 0.5150677396, blue: 0.1766780612, alpha: 1)))
                                        .font(.custom(MyFonts.SFUITextRegularG3.rawValue , size:12))
                                }
                            }
                            
                            VStack {
                                Text("stash is instant, money will be credited within")
                                Text("seconds")
                            }
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 12))
                            .padding(.top , 30)
                        }
                    }
                
                Spacer()
                
                if !pricingVM.showSecondLayer {
                    Button(action: {
                        pricingVM.showLoader = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(Animation.linear.speed(1.2)){
                                pricingVM.showSecondLayer = true
                                pricingVM.showLoader = false
                            }
                        }
                        
                    }, label: {
                        BottomButtonView(title: "Procced to EMI Selection")
                        
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.12, alignment: .center)
            .background(RoundedCorners(color: Color(#colorLiteral(red: 0.06798068434, green: 0.09960306436, blue: 0.1336584687, alpha: 1)), tl: 20, tr: 20, bl: 0, br: 0))
            .onTapGesture {
                if pricingVM.showSecondLayer {
                    pricingVM.showLoader = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(Animation.linear.speed(1)){
                            pricingVM.showSecondLayer = false
                            pricingVM.showThirdLayer = false
                            pricingVM.showLoader = false
                        }
                    }
                }
                
            }
        }
        
        
    }
    
    
}
