//
//  CustomButtonStyle.swift
//  GalleryApp
//
//  Created by Ellie on 6/28/23.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 40)
            configuration.label
                .foregroundColor(.white)
        }
        .shadow(radius: 5)
        .opacity(configuration.isPressed ? 0.8 : 1)
        .scaleEffect(configuration.isPressed ? 0.96 : 1)
        
    }
    
}
