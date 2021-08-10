//
//  TopItemsView.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//


import SwiftUI

struct TopItemsView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width : 30 ,height : 30)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                Image(systemName: "xmark")
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .font(.system(size: 12))
            }
            .frame(width : 30 ,height : 30)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width : 30 ,height : 30)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                Image(systemName: "questionmark")
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .font(.system(size: 12))
                
            }
            .frame(width : 30 ,height : 30)
        }
        .padding(.top , 45)
    }
}

