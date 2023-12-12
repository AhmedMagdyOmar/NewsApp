//
//  NewsHomeViewController.swift
//  NewsApp
//
//  Created by Ahmed on 07/12/2023.
//

import UIKit

class NewsHomeViewController: BaseController {

    //MARK: - Vars
    let vm: NewsHomeViewModel!
    
    //MARK: - Outlets
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindState()
        vm.checkConnection()
        updateView()
    }
    
    init(viewModel: NewsHomeViewModelIMP) {
        self.vm = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        title = "News"
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: NewsTableViewCell.self)
        tableView.rowHeight = 190
    }


}

//MARK: - TableViewDataSource And Delegate
extension NewsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getNewsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self, for: indexPath)
        cell.configCell(item: vm.getNewsItem(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vm.getNewsItem(index: indexPath.row)
        let vc = ObjectFactoryIMP.screenDetails(newsItemEntity: item).viewController
        push(vc)
    }
    
}

//MARK: - SearchBar Config
extension NewsHomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            vm.checkConnection()
            searchBar.resignFirstResponder()
        }
    }
      
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let searchText = searchBar.text, !searchText.isEmpty {
                vm.searcNews(keyWord: searchText)
                searchBar.resignFirstResponder()
            }
        }
}


extension NewsHomeViewController {
    func bindState() {
        if let viewModel = self.vm as? NewsHomeViewModelIMP {
            viewModel.$state.sink { state in
                self.handleScreenState(state)
                self.tableView.reloadData()
            }.store(in: &bag)
        }
    }
}
