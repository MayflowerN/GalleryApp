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
    @State var licenseLink: Bool = false
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
                        Text("50 Soap Bubbles").foregroundColor(.white).font(.title2)
                        Text("See what's coming in the next update").foregroundColor(.white)
                        Link("Follow Irisdesfera on Instagram >", destination: URL(string: "https:/www.codewithchris.com")!).foregroundColor(.blue)
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
            .navigationBarTitle("Iridisfera", displayMode: .inline) // Set the navigation bar title
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $openMenu) { // Use sheet instead of fullScreenCover
                NavigationView {
                    ZStack {
                        Color.white.opacity(0).edgesIgnoringSafeArea(.all)
                        VStack(spacing: 30) {
                            Text("").padding(30)
                            NavigationLink(destination: AboutPage(), isActive: $aboutLink) {
                                Button("About", action: {
                                    aboutLink.toggle()
                                }).font(.title)
                            }

                            Button("App Icon", action: {
                                openMenu.toggle()
                            }).font(.title)

                            NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https://iridisfera.app/legal/ios/")!)), isActive: $licenseLink) {
                                Button("License Agreement", action: {
                                    licenseLink.toggle()
                                }).font(.title)
                            }

                            Link("Privacy Policy", destination: URL(string: "https://iridisfera.app/privacy/")!).font(.title)

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
                Text("About Iridisfera").font(.largeTitle).foregroundColor(.white).padding()
                Text("After two years of the global pandemic, we all worked out ways of maintaining balance while social distancing. The soap film is my window; an extension of vision over great expanses. My name is Bogdan Chesaru. I made Iridisfera so you can wander with me.\n\nA soap film is a thin layer of water bounded by two layers of surfactant molecules. The iridescent colors arise from the interference of light waves reflecting off the front and back surfaces of the film. This natural phenomenon is known as thin-film interference.\n\nThank you for joining my soap bubble odyssey. If you want to make my day, leave a review.").font(.body).foregroundColor(.gray).multilineTextAlignment(.leading).frame(alignment: .topTrailing).padding()
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
