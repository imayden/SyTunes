//
//  NowPlayingView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/16/24.
//

import SwiftUI

struct SnakeBorderViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> SnakeBorderView {
        SnakeBorderView()
    }
    
    func updateUIView(_ uiView: SnakeBorderView, context: Context) {
    }
}

struct NowPlayingView: View {
    
    @State private var showingShareSheet = false
    
    @State private var isPlaying = false
    
    @State private var scale: CGFloat = 0.9
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)

                    ZStack{
                        
                        SnakeBorderViewRepresentable()
                                                .frame(width: 300, height: 300)
                                                .clipped()
                        
                        if let image = UIImage(named: "AlbumCover") {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                                .scaledToFit()
                                .scaleEffect(scale)
                                .clipped()
                                .gesture(
                                    MagnificationGesture()
                                        .onChanged { value in
                                            self.scale = value.magnitude
                                        }
                                )
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                                .scaledToFit()
                                .scaleEffect(scale)
                                .clipped()
                                .gesture(
                                    MagnificationGesture()
                                        .onChanged { value in
                                            self.scale = value.magnitude
                                        }
                                )
                        }
                    }
                    
                   
                    VStack {
                        Text("Cruel Summer")
                            .font(.title)
                            .padding(.top, 8)
                        Text("Taylor Swift")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 8)
                    
                    
                    HStack(spacing: 40) {
                        Button(action: {
                        }) {
                            Image(systemName: "backward.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action: {
                            isPlaying.toggle()
                        }) {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action: {
                        }) {
                            Image(systemName: "forward.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                        
                    }
                    .padding(20)
                
                    
                    Spacer(minLength: 20)

                    Button("Sy!") {
                        showingShareSheet = true
                    }
                    .padding(14)
                    .frame(width:260)
                    .background(Color.green)
                    .foregroundColor(.black)
                    .italic()
                    .font(.title)
                    .bold()
                    .cornerRadius(20)
                    .sheet(isPresented: $showingShareSheet) {
                        ShareSheet(itemsToShare: ["Share this song!"])
                    }
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .navigationTitle("Now Playing")
                .padding()
                
            }
        }
    }
}


#Preview {
    NowPlayingView()
}
