//
//  Posts.swift
//  Homework5
//
//  Created by Elif Yalçın on 29.01.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postData = try? newJSONDecoder().decode(PostData.self, from: jsonData)

import Foundation

// MARK: - PostDatum
struct PostDatum: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostData = [PostDatum]
