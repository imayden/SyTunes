//
//  ArtistsView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/16/24.
//

import SwiftUI

struct ArtistsView: View {
    @StateObject private var viewModel = ArtistsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.artists, id: \.id) { artist in
                NavigationLink(destination: ArtistDetailView(artist: artist)) {
                    Text(artist.name)
                }
            }
            .navigationTitle("Artists")
            .onAppear {
                viewModel.fetchArtists()
            }
        }
    }
}

#Preview {
    ArtistsView()
}
