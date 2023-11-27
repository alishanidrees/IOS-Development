//
//  UItableviewCell+Extension.swift
//  IOSecondProject
//
//  Created by Ali Shan on 14/11/2023.
//

import UIKit

public extension UITableView {
  func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
    let cellId = String(describing: type)
    register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
  }
}

extension UITableViewCell {
  static var identifier: String {
    return String(describing: self)
  }
}
