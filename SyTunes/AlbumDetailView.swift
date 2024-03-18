//
//  AlbumDetailView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/16/24.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album

    var body: some View {
        List {
            Section(header: Text("Songs")) {
                ForEach(album.tracks.items, id: \.id) { song in
                    VStack(alignment: .leading) {
                        Text(song.name)
                            .font(.headline)
                        Text(song.artists.map(\.name).joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle(album.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
