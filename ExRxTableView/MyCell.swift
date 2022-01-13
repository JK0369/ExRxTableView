//
//  MyCell.swift
//  ExRxTableView
//
//  Created by 김종권 on 2022/01/13.
//

//  MyCell.swift

import UIKit

final class MyCell: UITableViewCell {
  private let label: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 24)
    label.textColor = .black
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.contentView.addSubview(self.label)
    self.label.translatesAutoresizingMaskIntoConstraints = false
    self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
    self.label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
    self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    self.label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(text: "")
  }
  
  func prepare(text: String) {
    self.label.text = text
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}
