//
//  WaterShape.swift
//  WaterBottle
//
//  Created by Muhammet Eren on 8.02.2025.
//

import Foundation
import SwiftUI


struct WaterShape: Shape{
    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waterHeight = rect.height * (1 - progress)
        path.addRect(CGRect(x: 0, y: waterHeight, width: rect.width, height: rect.height - waterHeight))
        
        return path
    }
}
