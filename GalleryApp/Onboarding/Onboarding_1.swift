//
//  Onboarding_1.swift
//  GalleryApp
//
//  Created by Ellie on 7/18/23.
//
import SwiftUI

struct Onboarding_1: View {
    @State var showOnboarding_2: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer() // Move all the content to the bottom of the screen
                    
                    Text("Welcome to Zoom-in Zany!")
                        .font(Font.custom("San Francisco Display", size: 33).weight(.light))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 284, alignment: .top)
                    
                    Text("A Gallery filled with Visual Stories")
                        .font(Font.custom("Raanana", size: 13))
                        .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .padding(5)
                    
                    Button(action: {
                        showOnboarding_2 = true
                    }) {
                        Text("Get Started")
                            .font(Font.custom("SF Pro Display", size: 20).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 302, height: 64)
                    .background(Color(red: 1, green: 0.68, blue: 0.11))
                    .cornerRadius(34)
                    .fullScreenCover(isPresented: $showOnboarding_2) {
                        Onboarding_2()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    Image("onboarding_1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Onboarding_1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_1()
    }
}

