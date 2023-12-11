//
//  ArticlesDataModel.swift
//  NewsApp
//
//  Created by Ahmed on 07/12/2023.
//

import Foundation

 //MARK: - UpdateCarDataModel
struct MainNewsDataModel: Codable {
    var status: String
    var message: String?
    let totalResults: Int?
    let articles: [NewsModel]?
}

// MARK: - Article
struct NewsModel: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

