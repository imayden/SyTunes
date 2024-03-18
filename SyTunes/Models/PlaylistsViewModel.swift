//
//  PlaylistsViewModel.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//

import Foundation

//class PlaylistsViewModel: ObservableObject {
//    @Published var playlists: [Playlist] = []
//    private var spotifyService = SpotifyService()
//
//    func fetchPlaylists() {
//        let playlistIds = ["4GtQVhGjAwcHFz82UKy3Ca", "2UrZudVtKmKk9c2hqrj155"]
//        spotifyService.getPlaylists(byIds: playlistIds) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let playlists):
//                    self?.playlists = playlists
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//}
