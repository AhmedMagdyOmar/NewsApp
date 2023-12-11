//
//  NewDetailsViewModel.swift
//  NewsApp
//
//  Created by Ahmed on 11/12/2023.
//

import Foundation

protocol NewsDetailsViewModel {
    var getNewsImage: String {get}
    var getAuthor:String {get}
    var getTitle: String {get}
    var getSource: String {get}
    var getDescription: String {get}
    var getMarinArticleURL: String {get}
}

class NewsDetailsViewModelIMP : NewsDetailsViewModel {
    
    @Published var state: ScreenState<String> = .ideal
    @Published var data: Data?
    var newsModel: NewsModel!
    init(newsModel: NewsModel) {
        self.newsModel = newsModel
    }
    var getNewsImage: String {
        return newsModel.urlToImage ?? ""
    }
    var getAuthor:String {
        return newsModel.author ?? ""

    }
    var getTitle: String {
        return newsModel.title ?? ""
    }
    
    var getSource: String {
        return newsModel.source?.name ?? ""
    }

    
    var getDescription: String {
        return newsModel.articleDescription ?? ""
    }
    var getMarinArticleURL: String {
        return newsModel.url ?? ""
    }

}


