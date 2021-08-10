//
//  ContentView.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pricingVM : PricingViewModel = PricingViewModel()
    
    var body: some View{
        
        VStack(alignment:.center){
            VStack (alignment:.center){
                TopItemsView()
                Spacer()
                ZStack{
                    FirstLayer(pricingVM: pricingVM)
                    SecondLayer(pricingVM: pricingVM )
                        .offset(y : pricingVM.showSecondLayer ? 0 : 1000)
                    ThirdLayer(pricingVM: pricingVM)
                        .offset(y : pricingVM.showThirdLayer ? 0 : 1000)
                    if pricingVM.showLoader {
                        LoaderView(pricingVM: pricingVM)
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "chevron.backward")
                                .font(.system(size:30))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        }
                    }
                    .padding(.bottom , 150)
                    .offset(x: pricingVM.arrowOffsetx)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 24)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height , alignment: .center)
        .background(Color(#colorLiteral(red: 0.06803808361, green: 0.07955946773, blue: 0.099873133, alpha: 1)))
        .ignoresSafeArea(.all, edges: .top)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
