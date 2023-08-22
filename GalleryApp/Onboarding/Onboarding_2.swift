//
//  Onboarding_2.swift
//  GalleryApp
//
//  Created by Ellie on 6/17/23.
//

import SwiftUI

struct Onboarding_2: View {
    @State var showContentView: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
            
                VStack {
                    Spacer() // Move all the content to the bottom of the screen
                    
                    Text("Your Inspiration in One App!")
                        .font(
                            Font.custom("San Francisco Display", size: 31)
                                .weight(.light)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 284, alignment: .top)
                    
                    Text("Where I Share my Stories")
                        .font(Font.custom("Raanana", size: 13))
                        .foregroundColor(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .padding(5)
                    
                    
                    Button(action: {
                        showContentView = true
                    }) {
                        Text("View Artwork")
                            .font(
                                Font.custom("SF Pro Display", size: 20)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .foregroundColor(.clear)
                    .frame(width: 302, height: 64)
                    .background(Color(red: 1, green: 0.68, blue: 0.11))
                    .cornerRadius(34)
                    .fullScreenCover(isPresented: $showContentView) {
                        ContentView()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
            Image("onboarding_2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_2()
    }
}

