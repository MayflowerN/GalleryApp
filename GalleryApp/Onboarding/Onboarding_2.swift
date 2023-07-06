//
//  Onboarding_2.swift
//  GalleryApp
//
//  Created by Ellie on 6/17/23.
//

import SwiftUI

struct Onboarding_2: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack {
            Spacer()
            
            NavigationLink(destination: ContentView(), isActive: $isActive) {
                Button(action: {
                    isActive = true
                }) {
                    ZStack {
                        Capsule()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .frame(height: 45)
                            .padding(.horizontal, 55)
                            .padding(.vertical, 10)
                        
                        HStack {
                            Text("Embrace the beauty within")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                            
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .shadow(radius: 5)
                    }
                    .frame(width: 400)
                }
            }
            
            Spacer()
        }
        .background(
            Image("ellieBackground22")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        .navigationBarHidden(true)
        }
    
}

struct Onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_2()
    }
}
