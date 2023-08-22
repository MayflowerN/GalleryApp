//
//  ContentView.swift
//  GalleryApp
//
//  Created by Ellie on 6/17/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var openMenu: Bool = false
    @State var aboutLink: Bool = false
    @State var aboutMeLink: Bool = false
    @State var tappedImage: Int? = nil

    init() {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .dark
    }

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    LazyVGrid(columns: columns) { // Add spacing between images
                        ForEach(1...10, id: \.self) { i in
                            Image("Image\(i)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width/2, height: geo.size.height/2) // Adjust the image frame size
                                .cornerRadius(10)
                                .contentShape(Rectangle()) // Add contentShape modifier
                                .onTapGesture {
                                    tappedImage = i
                                }
                        }
                    }
                    .padding(.horizontal) // Add horizontal padding for the LazyVGrid

                    VStack {
                        Text("Ellie Nguyen").foregroundColor(.white).font(.title2)
                        Text("See what's coming in the next update").foregroundColor(.white)
                        Link("Follow me on Instagram >", destination: URL(string: "https://www.instagram.com/ellienween/")!).foregroundColor(.blue)
                    }
                    .padding(.top, 20) // Add top padding
                    .padding(.bottom, 30) // Add bottom padding
                }
                .overlay(alignment: .topTrailing) { // Move the overlay here
                    Button(action: {
                        openMenu.toggle()
                    }) {
                        Image(systemName: "chevron.down").font(.largeTitle)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Zoom-in Zany", displayMode: .inline) // Set the navigation bar title
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $openMenu) { // Use sheet instead of fullScreenCover
                NavigationView {
                    ZStack {
                        Color.white.opacity(0).edgesIgnoringSafeArea(.all)
                        VStack(spacing: 30) {
                            Text("").padding(30)
                            NavigationLink(destination: AboutPage(), isActive: $aboutLink) {
                                Button("About Zoom-in Zany", action: {
                                    aboutLink.toggle()
                                }).font(.title)
                            }


                            NavigationLink(destination: AboutMe(), isActive: $aboutMeLink) {
                                Button("About Me", action: {
                                    aboutMeLink.toggle()
                                }).font(.title)
                            }
                

                            Link("Follow me on Facebook", destination: URL(string: "https://www.facebook.com/vi.y.nguyen/")!).font(.title)
                            
                            Link("Follow me on Instagram", destination: URL(string: "https://www.instagram.com/ellienween/")!).font(.title)
                            Button("Back to App", action: {
                                openMenu.toggle()
                            }).font(.title)

                            Spacer()
                            Text("App Version 1.0").font(.subheadline).padding(20)
                        }
                    }
                    .navigationBarHidden(true)
                    .background(BackgroundBlurView())
                }
                .background(BackgroundBlurView())
            }
        }
        .overlay(
            Group {
                if let tappedIndex = tappedImage {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            Image("Image\(tappedIndex)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .onTapGesture {
                                    tappedImage = nil // Clear the tapped image index to close the overlay
                                }
                        )
                        .transition(.opacity)
                }
            }
        )
    }
}

struct AboutPage: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("About Zoom-in Zany").font(.largeTitle).foregroundColor(.white).padding()
                Text("Zoom-in Zany is my curated space where each snapshot tells a story from my informal photoshoots. It's more than just pictures; it's a wellspring of inspiration. Dive in to discover a tapestry of unique poses and innovative photography themes, designed to ignite your creativity and passion for arts.").font(.body).foregroundColor(.gray).multilineTextAlignment(.leading).frame(alignment: .topTrailing).padding()
                Spacer()
            }
        }
    }
}
struct AboutMe: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("About Me").font(.largeTitle).foregroundColor(.white).padding()
                Text(" I'm a self taught IOS developer, food adventurers, and photography enthusiasts. Zoom-in Zany is a collection of moments from my casual photoshoots. Through these images, I hope to offer a glimpse of different poses and photography themes, with the wish to inspire and share ideas with fellow enthusiasts.").font(.body).foregroundColor(.gray).multilineTextAlignment(.leading).frame(alignment: .topTrailing).padding()
                Spacer()
            }
        }
    }
}
struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))

        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
