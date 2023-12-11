//
//  UItableview+.swift
//  Caberz
//
//  Created by Youssef on 12/10/20.
//

import Foundation

import UIKit
extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        let section = numberOfSections
        if section > 0 {
            let row = numberOfRows(inSection: section - 1)
            if row > 0 {
                scrollToRow(at: IndexPath(row: row - 1, section: section - 1), at: .bottom, animated: animated)
            }
        }
    }
}



extension UITableView {
    func setNoData(text: String = "No Data Found".localize) {
        let lbl = UILabel(text: text, font: .mainMedium(of: 15) , textColor: .mainColor)
        lbl.textAlignment = .center
        self.backgroundView = lbl
    }
}
extension UITableView{
    func handleTableDesign() {
        self.tableFooterView = UIView()
        self.separatorInset = .zero
        self.contentInset = .zero
    }
}
extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }

}
