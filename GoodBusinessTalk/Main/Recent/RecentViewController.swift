//
//  RecentViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/17.
//

import UIKit

class RecentViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var postData = [Post(nickName: "잠보", levelTitle: "인턴", date: "2021-08-11", feedDescriptionLabel: "퇴사했습니다!!!")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
     tableView.delegate = self
     tableView.dataSource = self
     tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
     tableView.estimatedRowHeight = 235
     tableView.rowHeight = UITableView.automaticDimension
 
   }
  
}

extension RecentViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else {
      return postData.count
    }
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "testcell2") else { return UITableViewCell()}
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
  //    cell.post = postData[indexPath.row]
      let posts = postData[indexPath.row]
      cell.nicknameLabel.text = posts.nickName
      cell.levelLabel.text = posts.levelTitle
      cell.dateLabel.text = posts.date
      cell.feedDescriptionLabel.text = posts.feedDescriptionLabel
      if posts.feedDescriptionLabel.count > 50 {
        cell.moreButton.isHidden = false
      }
      print(posts.feedDescriptionLabel.count)
      return cell
    }
    return UITableViewCell()
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return 120.0
    } else if indexPath.section == 1 {
      return 216.0
    }
    return 45.0
  }
}
