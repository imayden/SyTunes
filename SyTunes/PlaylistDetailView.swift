//
//  PlaylistsDetailView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//

import SwiftUI

struct PlaylistDetailView: View {
    let playlist: SimplePlaylist

    var body: some View {
        List(playlist.tracks, id: \.id) { track in
            VStack(alignment: .leading, spacing: 4) {
                            Text(track.name)
                            Text(track.artist)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
        }
        .navigationTitle(playlist.name)
    }
}
