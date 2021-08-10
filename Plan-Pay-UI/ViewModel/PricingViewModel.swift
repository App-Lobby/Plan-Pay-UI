//
//  PricingViewModel.swift
//  Plan-Pay-UI
//
//  Created by Mohammad Yasir on 09/08/21.
//

import Foundation
import SwiftUI

class PricingViewModel : ObservableObject {
    
    // Mark:- Showing Layers
    @Published var showSecondLayer = false
    @Published var showThirdLayer = false
    
    // Mark:- Reflecting UI Values
    @Published var showLoader = false
    @Published var arrowOffsetx : CGFloat = 50
    @Published var degree = 360
    @Published var x : CGFloat = 0
    @Published var angle : Double = 105
    
    // Mark:- Reflecting UI Datas
    @Published var pricelist : [Pricing]
    @Published var selectedAmount : CGFloat = 0.3
    @Published var isPlanSelected : Bool = true
    @Published var selectedPlanIndex : Int = 0
    
    // Mark:- Initializing the Values
    init(){
        pricelist = [
            Pricing(selected: true, amount: 4247, duration: 12, recomended: false, color:Color(#colorLiteral(red: 0.2669191658, green: 0.2031365335, blue: 0.2422225177, alpha: 1))),
            Pricing(selected: false, amount: 3525, duration: 4, recomended: true, color: Color(#colorLiteral(red: 0.4869962335, green: 0.4509751797, blue: 0.5643727779, alpha: 1))),
            Pricing(selected: false, amount: 332, duration: 2, recomended: false, color: Color(#colorLiteral(red: 0.3508640528, green: 0.4129255414, blue: 0.5448428988, alpha: 1))),
            Pricing(selected: false, amount: 3234, duration: 5, recomended: false, color: Color(#colorLiteral(red: 0.262685822, green: 0.3249728803, blue: 0.2163285735, alpha: 1)))
        ]
    }
    
    // Mark:- Slecting Only One Plan in UI
    public func selectingPaln(index : Int) {
        for i in 0..<pricelist.count {
            if i == index {
                if pricelist[i].selected {
                    pricelist[i].selected = false
                } else {
                    pricelist[i].selected = true
                }
            } else {
                pricelist[i].selected = false
            }
        }
    }
    
    // Mark:- Checking if no Plan is Selected
    public func checkForPlanSelection() {
        for i in 0..<pricelist.count {
            if pricelist[i].selected == true {
                isPlanSelected = true
                selectedPlanIndex = i
                break
            } else {
                isPlanSelected = false
            }
        }
    }
    
    // Mark:- Handling draging the Slider
    public func onDrag(value: DragGesture.Value){
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
       
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        var angle = radians * 180 / .pi
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)){
            let progress = angle / 360
            self.selectedAmount = progress
            self.angle = Double(angle)
        }
        
    }
    
}

