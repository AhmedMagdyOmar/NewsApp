//
//  NewsHomeViewController.swift
//  NewsApp
//
//  Created by Ahmed on 07/12/2023.
//

import UIKit
enum StatusMode {
    case firstTime
    case secondTime
}
class NewsHomeViewController: BaseController {

    //MARK: - Vars
    let vm: NewsHomeViewModel!
    var statusMode: StatusMode = .firstTime
    
    //MARK: - Outlets
  
    @IBOutlet weak var tableView: UITableView!
    
  //  @IBOutlet weak var searchBar: UISearchBar!
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindState()
        vm.viewDidLoad()
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
       // searchBar.delegate = self
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
        print("the count me is \(vm.getNewsCount)")
        return vm.getNewsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self, for: indexPath)
        cell.configCell(item: vm.getNewsItem(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vm.getNewsItem(index: indexPath.row)
        let vm = NewsDetailsViewModelIMP(newsModel: item)
        let vc = NewsDetailsViewController(vm: vm)
        push(vc)
    }
    
}
//
////MARK: - SearchBar Config
//extension NewsHomeViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        presenter.didChange(text: searchText)
//    }
//}
//
////MARK: - View Protocol
//extension NewsHomeViewController: ArticlesHomeViewProtocol {
//    func reloadTableView() {
//        self.tableView.reloadData()
//    }
//}



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
