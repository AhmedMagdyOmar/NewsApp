//
//  ArticleHomePresenter.swift
//  NewsApp
//
//  Created by Ahmed on 14/02/2022.
//

import Foundation


struct CategoriesWithOwnArticles {
    var category: String
    var articles: [NewsModel]
}


enum ModeType {
    case defaultMode
    case searchMode
}

protocol NewsHomeViewModel {
    
    // Showing Selected Categories
    var getNewsCount:Int {get}
    func getNewsItem(index:Int) -> NewsModel
    func viewDidLoad()
//    var getNumberOfSearchedArticles: Int {get}
//    func didChange(text: String?)
//    func viewDidLoad()
//    var getModeType: ModeType {get}
  
}
class NewsHomeViewModelIMP {
    
    //MARK: - Vars
    @Published var state: ScreenState<String> = .ideal

    let ds = MainNewsDataSource()
    var bag = AppBag()
    var allNews: [NewsModel] = []

    var categoriesWithOwnArticles: [CategoriesWithOwnArticles] = []
    private let dispatchGroup: DispatchGroup = DispatchGroup()
    var searchedArticles: [NewsModel] = []
    var modeType:  ModeType = .defaultMode
    
    var categories: [String] = []
}

// MARK: - Implement Presenter Protocol
extension NewsHomeViewModelIMP: NewsHomeViewModel {
  
    var getNewsCount:Int {
        return allNews.count
    }
    
    func getNewsItem(index:Int) -> NewsModel {
        return self.allNews[index]
    }
    
    var getNumberOfSections: Int {
        categoriesWithOwnArticles.count
    }
    
    func viewDidLoad() {
        Task {
            await getAllNewsData()
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
                    //print("the all data is \(value?.data)")
                    //print("the all news is \(self.allNews)")
                  //  print("the counto is is \(self.allNews.count)")
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
    
//    func searchFor(_ keyword: String) {
//        self.view.startLoading()
//        repo.searchFor(keyword) { [weak self] response in
//            guard let self = self else {return}
//            self.view.stopLoading()
//            switch response {
//            case .success(let value):
//                self.searchedArticles = value.articles ?? []
//            case .error(let err):
//                self.handleErrorResponse(error: err, view: self.view)
//            }
//        }
//    }
}


