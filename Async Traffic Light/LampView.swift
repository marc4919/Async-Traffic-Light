//
//  LampView.swift
//  Async Traffic Light
//
//  Created by Marc Garcia Teodoro on 8/4/25.
//

import SwiftUI

struct LampView: View {
    var color: Color
    var lightSize: CGFloat = 50
    var isOn: Bool = false
    
    var body: some View {
        color
            .frame(width: lightSize, height: lightSize)
            .cornerRadius(lightSize / 2)
            .brightness(isOn ? 0.0 : -0.4)
            .animation(.easeInOut, value: isOn)
    }
}

#Preview {
    LampView(color: .red, isOn: false)
}
