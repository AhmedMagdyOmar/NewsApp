//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Ahmed on 14/02/2022.
//

import UIKit

protocol ArticleTableViewCellProtocol {
    func display(model: ArticleCellViewModel)
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
        containerView.layer.applySketchShadow(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), alpha: 1, x: 0, y: 5, blur: 20, spread: 0)
        }
    }
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleHeadLineLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    @IBOutlet weak var articleSourceNewsPaperLabel: UILabel!
    @IBOutlet weak var articleShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configCell(item: NewsModel) {
        articleImageView.load(with: item.urlToImage)
        articleHeadLineLabel.text = item.title
        articleDateLabel.text = "\(item.publishedAt ?? "")"
        articleShortDescriptionLabel.text = item.articleDescription
        articleSourceNewsPaperLabel.text = item.source?.name
    }
}
