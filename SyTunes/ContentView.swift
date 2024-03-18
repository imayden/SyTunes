//
//  ContentView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NowPlayingView()
                .tabItem {
                    Label("Now Playing", systemImage: "music.note")
                }
            
            AlbumsView()
                .tabItem {
                    Label("Albums", systemImage: "rectangle.stack.fill")
                }
            
            PlaylistsView()
                .tabItem {
                    Label("Playlists", systemImage: "music.note.list")
                }
            
            ArtistsView()
                .tabItem {
                    Label("Artists", systemImage: "person.fill")
                }
        }.accentColor(.green)
    }
}


#Preview {
    ContentView()
}

