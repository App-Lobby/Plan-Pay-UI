//
//  LoaderView.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct LoaderView: View {
    @ObservedObject var pricingVM : PricingViewModel
    var body: some View {
        HStack {
            Circle()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.5142012292, green: 0.5539634819, blue: 0.6096001851, alpha: 1)))
            Circle()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.5142012292, green: 0.5539634819, blue: 0.6096001851, alpha: 1)))
            Circle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
        }
        .rotation3DEffect(
            Angle(degrees: Double(pricingVM.degree)), axis: (x: CGFloat(0), y: CGFloat(1), z: CGFloat(0))
        )
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever()){
                pricingVM.degree += 720
            }
        }
    }
}
