//
//  SpotifyService.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/17/24.
//

import Foundation

struct Artist: Decodable {
    let name: String
    let id: String
    let uri: String
}

struct ExternalUrls: Decodable {
    let spotify: URL
}

struct AlbumImage: Decodable {
    let url: URL
    let height: Int
    let width: Int
}

struct Song: Decodable {
    let name: String
    let uri: String
    let id: String
    let artists: [Artist]
    let previewUrl: URL?
    let durationMs: Int
    let explicit: Bool
    let discNumber: Int
    let trackNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case uri
        case id
        case artists
        case previewUrl = "preview_url"
        case durationMs = "duration_ms"
        case explicit
        case discNumber = "disc_number"
        case trackNumber = "track_number"
    }
}


struct TracksResponse: Decodable {
    let items: [Song]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

struct Album: Decodable {
    let albumType: String
    let artists: [Artist]
    let externalUrls: ExternalUrls
    let id: String
    let images: [AlbumImage]
    let name: String
    let releaseDate: String
    let releaseDatePrecision: String
    let totalTracks: Int
    let tracks: TracksResponse
    
    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case externalUrls = "external_urls"
        case id
        case images
        case name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case tracks
    }
}



class SpotifyService {
    let headers = [
        "X-RapidAPI-Key": "5603942d72msh6e0c0fd4b36bda3p10a105jsnd3db8366aa75",
        "X-RapidAPI-Host": "spotify23.p.rapidapi.com"
    ]

    // get multiple albums
    func getAlbums(byIds ids: [String], completion: @escaping (Result<[Album], Error>) -> Void) {
        let joinedIds = ids.joined(separator: ",")
        let urlString = "https://spotify23.p.rapidapi.com/albums/?ids=\(joinedIds)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1002, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let albums = try self.parseAlbums(data: data)
                completion(.success(albums))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    // Parse multiple albums
    private func parseAlbums(data: Data) throws -> [Album] {
        let decoder = JSONDecoder()
        // Assuming the top-level key in the JSON response is "albums" and it contains an array of albums
        let response = try decoder.decode([String: [Album]].self, from: data)
        guard let albums = response["albums"] else {
            throw NSError(domain: "", code: -1003, userInfo: [NSLocalizedDescriptionKey: "No albums found in the response"])
        }
        return albums
    }
    
    // get multiple artists
    func getArtists(byIds ids: [String], completion: @escaping (Result<[Artist], Error>) -> Void) {
        let joinedIds = ids.joined(separator: ",")
        let urlString = "https://spotify23.p.rapidapi.com/artists/?ids=\(joinedIds)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1002, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let artists = try self.parseArtists(data: data)
                completion(.success(artists))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    // Parse multiple artists
    private func parseArtists(data: Data) throws -> [Artist] {
        let decoder = JSONDecoder()
        let response = try decoder.decode([String: [Artist]].self, from: data)
        guard let artists = response["artists"] else {
            throw NSError(domain: "", code: -1003, userInfo: [NSLocalizedDescriptionKey: "No artists found in the response"])
        }
        return artists
    }
    

}


