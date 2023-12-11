//
//  NewsRepo.swift
//  NewsApp
//
//  Created by Ahmed on 07/12/2023.
//

import Foundation


class GetAllMainNews: RequestMaker {
    @GET<MainNewsDataModel>(url: .path("everything?q=apple&from=2023-11-20&apiKey=57c64a59ec4649afbbada24f5244a4f3"))
    var network: any Network<MainNewsDataModel>
}


class MainNewsDataSource {
    let getAllMainNews: any RequestMaker<MainNewsDataModel> = GetAllMainNews()
    
}
