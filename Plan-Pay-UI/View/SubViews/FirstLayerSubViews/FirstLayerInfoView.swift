//
//  FirstLayerInfoView.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct FirstLayerInfoView: View {
    
    @ObservedObject var pricingVM : PricingViewModel
    
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("credit amount")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                Text("\(Int(pricingVM.selectedAmount * 20000))")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.3335540614, green: 0.3335540614, blue: 0.3335540614, alpha: 1)))
            
            Spacer()
            
            Image(systemName: "chevron.backward")
                .rotationEffect(.degrees(-90))
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .font(.system(size: 18))
        }
        .padding(.horizontal , 24)
        .padding(.top , 20)
    }
}
