//
//  Photos.swift
//  CodingChallenge
//
//  Created by Usama Jamil on 09/05/2022.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let id, author: String?
    let width, height: Int?
    let url, downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

typealias Photos = [Photo]
