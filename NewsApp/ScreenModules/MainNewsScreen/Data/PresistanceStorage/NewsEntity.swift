//
//  NewsEntity.swift
//  NewsApp
//
//  Created by Ahmed on 11/12/2023.
//

import Foundation
import CoreData

class NewsItem : NSManagedObject{
    @NSManaged var title: String
    @NSManaged var author: String
    @NSManaged var articleDescription: String
    @NSManaged var urlToImage: String
    @NSManaged var sourceName: String
    @NSManaged var publishedAt: String
    @NSManaged var articleURL: String
    @NSManaged var imageData: String
}

