//
//  SongCardView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//


import SwiftUI

struct SongCardView: View {
    let songName: String
    let artistName: String
    @State var isPlaying: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "photo") 
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(songName).bold()
                Text(artistName).font(.caption)
            }
            Spacer()
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}
