//
//  AlbumsView.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/16/24.
//


import SwiftUI

struct AlbumsView: View {
    @StateObject private var viewModel = AlbumsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.albums, id: \.id) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    HStack {
                        AsyncImage(url: album.images.first?.url) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 60, height: 60)
                        .cornerRadius(3)

                        VStack(alignment: .leading) {
                            Text(album.name)
                                .font(.headline)
                            Text(album.artists.map(\.name).joined(separator: ", "))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Albums")
            .onAppear {
                viewModel.fetchAlbums()
            }
        }
    }
}


#Preview {
    AlbumsView()
}
