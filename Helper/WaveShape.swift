//
//  WaveShape.swift
//  WaterBottle
//
//  Created by Muhammet Eren on 8.02.2025.
//

import Foundation
import SwiftUI

struct WaveShape: Shape {
    var progress: CGFloat
    var waveOffset: CGFloat
    var waveHeight: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get{ AnimatablePair(progress,waveOffset)}
        set{
            progress = newValue.first
            waveOffset = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waterHeight = rect.height * (1 - progress)
        
        path.move(to: CGPoint(x:0,y: waterHeight))
        for x in stride(from: 0, to: rect.width, by: 1){
            let relativeX = x / rect.width
            let sine = sin((relativeX + waveOffset) * .pi * 2)
            let y = waterHeight + sine * waveHeight
            path.addLine(to: CGPoint(x:x, y: y))
            
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
                
    }
}
