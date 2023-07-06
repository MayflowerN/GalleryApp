//
//  Onboarding_1.swift
//  GalleryApp
//
//  Created by Ellie on 6/17/23.
//

import SwiftUI

struct Onboarding_1: View {
    @State var isActive:Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Discover the extraordinary in simplicity.")
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                Spacer()
                
                NavigationLink(destination: Onboarding_2(), isActive: $isActive) {
                    Button(action: {
                        isActive = true
                    }) {
                        Image(systemName: "chevron.right.square.fill")
                            .font(.system(size: 45))
                            .foregroundColor(Color.white)
                    }
                }
                
                Spacer()
            }
        }
        .background(
            Image("ellieBackground1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        .navigationBarHidden(true)
    }

            
        
    }

    
    
    struct Onboarding_1_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding_1()
        }
    }

