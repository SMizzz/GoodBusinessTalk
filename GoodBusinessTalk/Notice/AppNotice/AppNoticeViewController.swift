//
//  AppNoticeViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/20.
//

import UIKit

class AppNoticeViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var expanedIndexSet: IndexSet = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: "AppNoticeTableViewCell", bundle: nil),
      forCellReuseIdentifier: "AppNoticeTableViewCell")
    tableView.layer.cornerRadius = 25
  }

}

extension AppNoticeViewController:
  UITableViewDataSource,
  UITableViewDelegate {
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return 3
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "AppNoticeTableViewCell",
      for: indexPath) as! AppNoticeTableViewCell
    cell.titleLabel.text = "안녕하세요. 좋소톡 대표입니다."
    cell.contentLabel.text = "이번 버전 1.0은 직원들의 편의와 복지를 제공하고자 만들어졌습니다."
    cell.dateLabel.text = "2021-08-31 12:42"
    
    if expanedIndexSet.contains(indexPath.row) {
      cell.contentLabel.isHidden = false
      cell.contentLabel.numberOfLines = 0
      cell.moreButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    } else {
      cell.contentLabel.isHidden = true
      cell.moreButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    if expanedIndexSet.contains(indexPath.row) {
      expanedIndexSet.remove(indexPath.row)
    } else {
      expanedIndexSet.insert(indexPath.row)
    }
    self.tableView.reloadRows(at: [indexPath], with: .automatic)
    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
  }
  
}
