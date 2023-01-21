//
//  HomePageModelClass.swift
//  Task
//
//  Created by Apple on 21/01/2023.
//

import Foundation
struct HomePageModelClass: Codable {
    let articles: [Article]
    let status: String
}

// MARK: - Article
struct Article: Codable {
    let id: Int
    let title: String
    let createdAt: String?
    let bodyHTML: String
    let blogID: Int
    let author: String?
    let userID: Int
    let publishedAt, updatedAt: String?
    let summaryHTML: String
    let templateSuffix: String?
    let handle: String
    let tags: String?
    let adminGraphqlAPIID: String
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case createdAt = "created_at"
        case bodyHTML = "body_html"
        case blogID = "blog_id"
        case author
        case userID = "user_id"
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case summaryHTML = "summary_html"
        case templateSuffix = "template_suffix"
        case handle, tags
        case adminGraphqlAPIID = "admin_graphql_api_id"
        case image
    }
}
// MARK: - Image
struct Image: Codable {
    let createdAt: String?
    let alt: String
    let width, height: Int
    let src: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case alt, width, height, src
    }
}
