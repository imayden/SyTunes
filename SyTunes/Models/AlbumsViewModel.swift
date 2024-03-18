//
//  AlbumsViewModel.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//
import SwiftUI

class AlbumsViewModel: ObservableObject {
    @Published var albums: [Album] = []
    private var spotifyService = SpotifyService()

    func fetchAlbums() {
        let albumIds = ["1NAmidJlEaVgA3MpcPFYGq", "64LU4c1nfjz1t4VnGhagcg", "6DEjYFkNZh67HP7R9PSZvv", "5AEDGbliTTfjOB8TSm1sxt"]
        spotifyService.getAlbums(byIds: albumIds) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let albums):
                    self?.albums = albums
                case .failure(let error):
                    print("Error while getting albums: \(error)")
                }
            }
        }
    }
}
