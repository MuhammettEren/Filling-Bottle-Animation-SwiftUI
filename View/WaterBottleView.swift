//
//  WaterBottleView.swift
//  WaterBottle
//
//  Created by Muhammet Eren on 8.02.2025.
//

import SwiftUI

struct WaterBottleView: View {
    @StateObject private var viewModel = WaterBottleViewModel()
    @State private var waveOffset: CGFloat = 0.0
    @State private var waterLevel: CGFloat = 0.0
    @State private var displayedWaterLevel: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 5)
                .stroke(.blue,lineWidth: 4)
                .background(.blue)
                .frame(width: 50,height: 40)
                .offset(y:-170)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 4)
                .foregroundColor(.blue)
                .frame(width: 150,height: 300)
            
            WaveShape(progress: waterLevel, waveOffset: waveOffset, waveHeight: 10)
                .fill(LinearGradient(colors: [Color.blue.opacity(0.8), Color.blue], startPoint: .top, endPoint: .bottom))
                .frame(width: 150,height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment:.center) {
                Text("Water level")
                    .font(.headline)
                
                Text("\(displayedWaterLevel, specifier: "%.2f")")
                    .font(.subheadline)
            }
            .offset(y:-250)
            
        }
        .onAppear {
            withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                waveOffset = 1.0
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 2.0)) {
                waterLevel = waterLevel == 1.0 ? 0.0 : 0.75
            }
        }
        .onChange(of: waterLevel) { newValue in
            withAnimation(.linear(duration: 2.0)) {
                displayedWaterLevel = newValue
            }
        }
    }
}

#Preview {
    WaterBottleView()
}
