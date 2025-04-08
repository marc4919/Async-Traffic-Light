//
//  TrafficLightView.swift
//  Async Traffic Light
//
//  Created by Marc Garcia Teodoro on 8/4/25.
//

import SwiftUI

struct TrafficLightView: View {
    enum ActiveLight {
        case red, yellow, green
    }
    
    @State private var activeLight: ActiveLight = .red
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 10) {
                LampView(color: .red, isOn: activeLight == .red)
                LampView(color: .yellow, isOn: activeLight == .yellow)
                LampView(color: .green, isOn: activeLight == .green)
            }
            .frame(width: 80, height: 240)
            .background(Color.black)
            .cornerRadius(5)
            
            Color.black
                .frame(width: 30, height: 120)
        }
        .onAppear(perform: startSemaforoTimer)

        
    }
    
    private func startSemaforoTimer() {
        Task {
            while true {
                try? await Task.sleep(for: .seconds(1))
                await MainActor.run {
                    switch activeLight {
                    case .red:
                        activeLight = .yellow
                    case .yellow:
                        activeLight = .green
                    case .green:
                        activeLight = .red
                    }
                }
            }
        }
    }
}

#Preview {
    TrafficLightView()
}
