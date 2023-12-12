//
//  ObjectFactory.swift
//  NewsApp
//
//  Created by Ahmed on 12/12/2023.
//

import UIKit

protocol ObjectFactoryProtocol {
    var viewController: UIViewController {get}
}

enum ObjectFactoryIMP: ObjectFactoryProtocol {
    case mainNewsScreen
    case screenDetails(newsItemEntity: NewItemEntity)

    var viewController: UIViewController {
        switch self {
        case .mainNewsScreen:
            let vm = NewsHomeViewModelIMP()
            let vc = NewsHomeViewController(viewModel: vm)
            return vc
        case .screenDetails(let newsItemEntity):
            let vm = NewsDetailsViewModelIMP(newsModel: newsItemEntity)
            let vc = NewsDetailsViewController(vm: vm)
            return vc
        }
           
    }
           
}
                
