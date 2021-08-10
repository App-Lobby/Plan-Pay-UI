//
//  BottomButtonView.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import SwiftUI

struct BottomButtonView: View {
    @State var title : String
    var body: some View {
        HStack{
            Spacer()
            Text(title)
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .font(.custom(MyFonts.SFUITextSemibold.rawValue , size:16))
            Spacer()
        }
        .frame(height : 70)
        .background(RoundedCorners(color: Color(#colorLiteral(red: 0.2300040126, green: 0.2765179873, blue: 0.6062863469, alpha: 1)), tl: 20, tr: 20, bl: 0, br: 0))
    }
}
