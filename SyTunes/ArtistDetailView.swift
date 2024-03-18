//
//  ArtistsDetailView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//

import SwiftUI

struct ArtistDetailView: View {
    let artist: Artist

    var body: some View {
        VStack {
            Text(artist.name)
                .font(.largeTitle)
            Text("Artist ID: " + artist.id)
                .font(.caption)
            Text("Artist Homepage: " + artist.uri)
                .font(.caption)
        }
        .navigationTitle("Artist Details")
    }
}
