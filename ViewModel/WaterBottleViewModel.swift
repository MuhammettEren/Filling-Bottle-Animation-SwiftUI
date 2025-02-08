//
//  WaterBottleViewModel.swift
//  WaterBottle
//
//  Created by Muhammet Eren on 8.02.2025.
//

import Foundation
import SwiftUI


class WaterBottleViewModel: ObservableObject {
    @Published var waterLevel: CGFloat = 0.0
    
    func toggleWaterLevel() {
        withAnimation(.easeIn(duration: 2.0)){
            waterLevel = waterLevel == 1.0 ? 0.0 : 1.0
        }
    }
}
