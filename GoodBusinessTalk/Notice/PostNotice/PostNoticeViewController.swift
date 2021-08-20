//
//  PostNoticeViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/20.
//

import UIKit

class PostNoticeViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.layer.cornerRadius = 25
  }
}

extension PostNoticeViewController:
  UITableViewDelegate,
  UITableViewDataSource {
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostNoticeCell", for: indexPath)
    cell.textLabel?.font = UIFont(name: "SpoqaHanSans-Regular", size: 15)
    cell.detailTextLabel?.font = UIFont(name: "SpoqaHanSans-Regular", size: 13)
    cell.textLabel?.text = "새 글이 게시되었습니다."
    cell.detailTextLabel?.text = "2021-08-16 02:35"
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 70.0
  }
  
}
