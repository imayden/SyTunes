//
//  PlaylistsView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/16/24.
//

import SwiftUI

struct SimpleTrack: Identifiable {
    var id = UUID()
    var name: String
    var artist: String
}


struct SimplePlaylist: Identifiable {
    var id = UUID()
    var name: String
    var tracks: [SimpleTrack]
}


struct PlaylistsView: View {

    private var playlists = [
        SimplePlaylist(name: "My Favorites", tracks: [
            SimpleTrack(name: "Cruel Summer", artist: "Taylor Swift"),
            SimpleTrack(name: "Western Wind", artist: "Carly Rae Jepsen")
        ]),
        SimplePlaylist(name: "My Collections", tracks: [
            SimpleTrack(name: "7 Rings", artist: "Ariana Grande"),
            SimpleTrack(name: "Roar", artist: "Katy Perry")
        ])
    ]

    var body: some View {
        NavigationView {
            List(playlists, id: \.id) { playlist in
                NavigationLink(destination: PlaylistDetailView(playlist: playlist)) {
                    VStack(alignment: .leading) {
                        Text(playlist.name).font(.headline)
                    }
                }
            }
            .navigationTitle("Playlists")
        }
    }
}




#Preview {
    PlaylistsView()
}
