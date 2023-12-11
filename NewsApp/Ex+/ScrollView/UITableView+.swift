//
//  UITableViewCell + Extension.swift
//  Driver App
//
//  Created by youssef on 9/17/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

typealias TableViewProtocols = UITableViewDelegate & UITableViewDataSource

extension UITableView {
    
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type) {
        register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<T: UITableViewCell>(_ T: UITableViewCell.Type) -> T {
        let identifier = String(describing: T.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("Error in cell")
        }
        
        return cell
    }
}
