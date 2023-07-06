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
    @State var openMenu:Bool = false
    @State var aboutLink:Bool = false
    @State var licenseLink:Bool = false
    init(){
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .dark
    }
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(1...10, id: \.self){ i in
                        Image("Image\(i)")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(height: 300)
                                                    .cornerRadius(10)
                                                    .padding(5)
                                                    
                        
                        
                    }
                }
                HStack {
                    VStack {
                        Text("50 Soap Bubbles").foregroundColor(.white).font(.title2)
                        Text("See whats coming in the next update").foregroundColor(.white)
                        Link("Follow Irisdesfera on Instagram >", destination: URL(string:"https:/www.codewithchris.com")!)
                            .foregroundColor(.blue)
                    }
                }
                /*NavigationLink(destination: AboutPage(), isActive: $aboutLink) { EmptyView()
                 } */
            }
        }
        .navigationBarBackButtonHidden(true)
        /*.navigationBarItems(trailing:
         Button(action: {
         openMenu = true
         print("triggered")
         },
         label: { Image(systemName: "chevron.down").font(.title)
         }))
         */
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    openMenu.toggle()
                }, label: {
                    Image(systemName: "chevron.down").font(.title)
                })
                
            }
        }
        //.fullScreenCover(isPresented: $openMenu, content: {
        .sheet(isPresented: $openMenu, content: {
            NavigationView {
            ZStack {
                Color.white.opacity(0).edgesIgnoringSafeArea(.all)
                VStack(spacing: 30) {
                    Text("").padding(30)
                    
                    NavigationLink(destination: AboutPage(), isActive: $aboutLink) {
                        Button("About", action: {
                            aboutLink.toggle()
                        }).font(.title).foregroundColor(Color.accentColor)
                        
                    }
                  
                    
                    Button("App Icon", action: {
                        openMenu.toggle()
                    }).font(.title).foregroundColor(Color.accentColor)
                    
                    
                    NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https:iridisfera.app/legal/ios/")!)), isActive: $licenseLink) {
                        Button("License Agreement", action: {
                            licenseLink.toggle()
                        }).font(.title).foregroundColor(Color.accentColor)
                    }
                    
                    
                    Link("Privacy Policy", destination: URL(string:"https://iridisfera.app/privacy/")!).font(.title).foregroundColor(Color.accentColor)
                    
                    
                    
                    
                    
                    Spacer()
                    Text("App Version 1.0").font(.subheadline).padding(20)
                   
                }
                
                
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .background(BackgroundBlurView())
        }
            .background(BackgroundBlurView())
        })
    }
}
    
    struct AboutPage:View {
        var body: some View {
            HStack (alignment: .top) {
                VStack {
                    Text ("About Iridisfere").font(.largeTitle).foregroundColor(.white).padding()
                    Text("After two years of global pandemic, we all worked out ways of maintaining balance while social distancing. The soap film is my window; an extension of vision over great expanses. My name is Bogdan Chesaru. I made Iridisfera so you can wander with me.\n\nA soap film is a thin layer of water bounded by two layers of surfactant molecules. The iridescent colors arise from the interference of light waves reflecting off the front and back surfaces of the film. This natural phenomenon is known as thin-film interference.\n\nThank you for joining my soap bubble odyssey. If you want to make my day, leave a review.").font(.body).foregroundColor(.gray).multilineTextAlignment(.leading).padding()
                    Spacer()
                }
            }
        }
    }
struct WebView: UIViewRepresentable{
    let request:URLRequest
func makeUIView(context: Context) ->  WKWebView {
    return WKWebView()
}
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }

}
    
    struct BackgroundBlurView:UIViewRepresentable{
        func makeUIView(context: Context) -> some UIView {
            let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
            
            DispatchQueue.main.async{
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
