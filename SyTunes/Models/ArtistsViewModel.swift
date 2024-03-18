//
//  ArtistsViewModel.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//

import Foundation

class ArtistsViewModel: ObservableObject {
    @Published var artists: [Artist] = []
    private var spotifyService = SpotifyService()

    func fetchArtists() {
        let artistIds = ["06HL4z0CvFAxyc27GXpf02", "66CXWjxzNUsdJxJ2JdwvnR"]
        spotifyService.getArtists(byIds: artistIds) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArtists):
                    self?.artists = fetchedArtists
                case .failure(let error):
                    print("Error fetching artists: \(error)")
                }
            }
        }
    }
}
