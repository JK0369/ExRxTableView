//
//  ViewController.swift
//  ExRxTableView
//
//  Created by 김종권 on 2022/01/13.
//

//  ViewController.swift

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
  
  private let tableView: UITableView = {
    let view = UITableView()
    view.register(MyCell.self, forCellReuseIdentifier: "cell")
    return view
  }()
  
  private var dataSource = Observable<[String]>.of((1...30).map(String.init))
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

    self.tableView.reloadData()
    
    self.dataSource
      .bind(to: self.tableView.rx.items) { tableView, row, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: IndexPath(row: row, section: 0)) as! MyCell
        cell.prepare(text: item)
        return cell
      }
      .disposed(by: self.disposeBag)
  }
}
