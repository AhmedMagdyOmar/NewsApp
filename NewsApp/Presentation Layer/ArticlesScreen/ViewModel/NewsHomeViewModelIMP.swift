//
//  ArticleHomePresenter.swift
//  NewsApp
//
//  Created by Ahmed on 14/02/2022.
//

import Foundation


protocol NewsHomeViewModel {
    var getNewsCount:Int {get}
    func getNewsItem(index:Int) -> NewsModel
    func searcNews(keyWord: String)
    func viewDidLoad()
    
}

class NewsHomeViewModelIMP {
    
    //MARK: - Vars
    @Published var state: ScreenState<String> = .ideal

    let ds = MainNewsDataSource()
    var bag = AppBag()
    var allNews: [NewsModel] = []
}

// MARK: - Implement Presenter Protocol
extension NewsHomeViewModelIMP: NewsHomeViewModel {
  
    var getNewsCount:Int {
        return allNews.count
    }
    
    func getNewsItem(index:Int) -> NewsModel {
        return self.allNews[index]
    }
    
    func searcNews(keyWord: String)  {
        Task {
            await searchFor(keyWord)
        }
    }
 
    func viewDidLoad() {
        Task {
            await getAllNewsData()
        }
    }

    func sortItems(allNews: [NewsModel]) {
        self.allNews = (allNews).sorted { (article1, article2) -> Bool in
            if let date1 = article1.publishedAt, let date2 = article2.publishedAt {
                return date1 > date2 // Sort from new to old
            }
            return false // Handle cases where date is nil if needed
        }
    }
}


//MARK: -  Networking
extension NewsHomeViewModelIMP {
    
    @MainActor
    func getAllNewsData() async {
        state = .loading
        await ds.getAllMainNews
            .makeRequest()
            .map({ state in
                switch state {
                case .success(let value):
                    self.allNews = value?.articles ?? []
                    return .success("")
                case .fail(let error):
                    return .failure(error.errorDescription)
                case .anyModelSuccess(_):
                    return .success("")
                }
            })
            .assign(to: \.state, on: self)
            .store(in: &bag)
    
    }
    
    @MainActor
    func searchFor(_ keyword: String) async {
        state = .loading
        await ds.searchForNews.addPathVariables(path: "&q=\(keyword)")
            .makeRequest()
            .map({ state in
                switch state {
                case .success(let value):
//                    self.allNews = value?.articles ?? []
                    self.sortItems(allNews: value?.articles ?? [])
                    return .success("")
                case .fail(let error):
                    return .failure(error.errorDescription)
                case .anyModelSuccess(_):
                    return .success("")
                }
            })
            .assign(to: \.state, on: self)
            .store(in: &bag)
    }
}


