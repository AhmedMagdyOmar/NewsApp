//
//  ArticleHomePresenter.swift
//  NewsApp
//
//  Created by Ahmed on 14/02/2022.
//

import Foundation


protocol NewsHomeViewModel {
    var getNewsCount:Int {get}
    func getNewsItem(index:Int) -> NewItemEntity
    func searcNews(keyWord: String)
    func checkConnection()
    
}

class NewsHomeViewModelIMP {
    
    //MARK: - Vars
    @Published var state: ScreenState<String> = .ideal
    let db = DBManager()
    let ds = MainNewsDataSource()
    var bag = AppBag()
    var allNews: [NewItemEntity] = []
}

// MARK: - Implement Presenter Protocol
extension NewsHomeViewModelIMP: NewsHomeViewModel {
  
    var getNewsCount:Int {
        return allNews.count
    }
    
    func getNewsItem(index:Int) -> NewItemEntity {
        return self.allNews[index]
    }
    
    func searcNews(keyWord: String)  {
        Task {
            await searchFor(keyWord)
        }
    }
 
 
    func checkConnection() {
        let networkMonitor = NetworkMonitor()
        networkMonitor.startMonitoring()

        Task {
            let status =  networkMonitor.getConnectionStatus()
            switch status {
            case .connected:
                await getAllNewsData()
            case .disconnected:
                await getStorageData()
            }
        }
    }
    
    func sortItems(allNews: [NewsModel]) {
        let sortedItems = allNews.sorted { (article1, article2) -> Bool in
              let date1 = article1.publishedAt ?? ""
              let date2 = article2.publishedAt ?? ""
              
              return date1 > date2 // Sort from new to old
          }
        self.newsModelMapper(newsModel: sortedItems)
    }
    
    func storeDataLocaly(allNews: [NewsModel]) {
        allNews.forEach { item in
            let news = db.add(NewsItem.self, attribute: "urlToImage", value: item.urlToImage ?? "")
            news?.title = item.title ?? ""
            news?.author = item.author ?? ""
            news?.publishedAt = item.publishedAt ?? ""
            news?.sourceName = item.source?.name ?? ""
            news?.articleDescription = item.articleDescription ?? ""
            news?.urlToImage = item.urlToImage ?? ""
            db.save()
        }
    }
    
    @MainActor
    func getStorageData() async {
        let data = db.fetch(NewsItem.self)
        self.allNews = data.map({ item in
            NewItemEntity(title: item.title, author: item.author , articleDescription: item.articleDescription, urlToImage: item.urlToImage, sourceName: item.sourceName, publishedAt: item.publishedAt, articleURL: item.articleURL)
        })
        state = .ideal
    }
    
    func newsModelMapper(newsModel:[NewsModel]) {
        let items = newsModel.map { item in
            NewItemEntity(title: item.title ?? "", author: item.author ?? "", articleDescription: item.articleDescription ?? "", urlToImage: item.urlToImage ?? "", sourceName: item.source?.name ?? "", publishedAt: item.publishedAt ?? "", articleURL: item.url ?? "")
        }
        self.allNews = items
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
                    self.newsModelMapper(newsModel: value?.articles ?? [])
                    self.storeDataLocaly(allNews: value?.articles ?? [])
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
                    self.sortItems(allNews: value?.articles ?? [] )
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


