//
//  NewsRepo.swift
//  NewsApp
//
//  Created by Ahmed on 07/12/2023.
//

import Foundation


class GetAllMainNews: RequestMaker {
    @GET<MainNewsDataModel>(url: .path("everything?q=apple&from=2023-11-20&apiKey=\(Constants.APIKey)"))
    var network: any Network<MainNewsDataModel>
}

class SearchForNews: RequestMaker {
    @GET<MainNewsDataModel>(url: .path("everything?apiKey=\(Constants.APIKey)"))
    var network: any Network<MainNewsDataModel>
}

class MainNewsDataSource {
    let getAllMainNews: any RequestMaker<MainNewsDataModel> = GetAllMainNews()
    let searchForNews: any RequestMaker<MainNewsDataModel> = SearchForNews()

}
