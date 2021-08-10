//
//  FirstLayerTopView.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct FirstLayerTopView: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack {
                Text("yasir, how much do you need?")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.custom(MyFonts.SFUITextBold.rawValue , size:20))
                Spacer()
            }
            .padding(.leading , 24)
            .padding(.top , 10)
            HStack {
                Text("move the diat and set any amount you need upto ₹ 459.891")
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .font(.custom(MyFonts.SFUITextRegular.rawValue, size: 14))
                Spacer()
            }
            .padding(.leading , 24)
            .padding(.trailing , 50)
            .padding(.top , 10)
        }
    }
}

