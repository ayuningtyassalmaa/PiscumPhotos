//
//  PiscumPhotosModel.swift
//  PiscumPhotos
//
//  Created by Salma Ayuningtyas on 10/17/25.
//

import Foundation

struct PiscumPhotosModel: Codable {
    let id: String
    let author: String
    let widht: Int
    let height: Int
    let url: String
    let download_url: String
}
