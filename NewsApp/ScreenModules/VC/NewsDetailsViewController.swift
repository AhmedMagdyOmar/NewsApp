//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Ahmed on 11/12/2023.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var autorLable: UILabel!
    @IBOutlet weak var descriptiontextView: UITextView!
    @IBOutlet weak var sourceLable: UILabel!
    @IBOutlet weak var gotToArticlesBtn: UIButton!
    @IBOutlet weak var newsImageView: UIImageView!
    
    let vm : NewsDetailsViewModel
    
    init(vm: NewsDetailsViewModelIMP) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }


    @IBAction func goToArticlesBtn(_ sender: Any) {
        let url = vm.getMarinArticleURL
        openUrl(url: url)
    }
    
    
    func setData() {
        newsImageView.load(with: vm.getNewsImage)
        titleLable.text = vm.getTitle
        autorLable.text = "Writen By" + " " + vm.getAuthor
        descriptiontextView.text = vm.getDescription
        sourceLable.text = "Source:" + " " + vm.getSource
        
    }

    func setUI() {
        gotToArticlesBtn.underlineText()
    }

}
