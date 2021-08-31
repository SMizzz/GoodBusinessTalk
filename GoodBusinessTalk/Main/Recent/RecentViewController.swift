//
//  RecentViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/17.
//

import UIKit

class RecentViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var expandedIndexSet: IndexSet = []
  
  var posts = [Post]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: "PostTableViewCell", bundle: nil),
      forCellReuseIdentifier: "PostTableViewCell")
    tableView.estimatedRowHeight = 235
    tableView.rowHeight = UITableView.automaticDimension
  }
  
  private func getData() {
    
  }
  
}

extension RecentViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 2
  }
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else {
      return 10
    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "blankCell")
      else { return UITableViewCell()}
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "PostTableViewCell",
        for: indexPath) as! PostTableViewCell
//      let posts = postData[indexPath.row]
      cell.recentDelegate = self
//      cell.nicknameLabel.text = posts.nickName
//      cell.levelLabel.text = posts.levelTitle
//      cell.dateLabel.text = posts.date
//      cell.feedDescriptionLabel.text = posts.feedDescriptionLabel
//      print(posts.feedDescriptionLabel.count)
//      
//      if posts.feedDescriptionLabel.count > 100 {
//        cell.moreButton.isHidden = false
//        if expandedIndexSet.contains(indexPath.row) {
//          cell.feedDescriptionLabel.numberOfLines = 0
//          cell.moreButton.isHidden = true
//        } else {
//          cell.moreButton.isHidden = false
//          cell.moreButton.setTitle("..더보기", for: .normal)
//        }
//      } else {
//        cell.feedDescriptionLabel.numberOfLines = 4
//        cell.moreButton.isHidden = true
//      }
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    if indexPath.section == 0 {
      return 125.0
    }
    return UITableView.automaticDimension
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    if let cell = tableView.dequeueReusableCell(
        withIdentifier: "PostTableViewCell") as? PostTableViewCell {
      if expandedIndexSet.contains(indexPath.row) {
        expandedIndexSet.remove(indexPath.row)
        cell.moreButton.setTitle("..더보기", for: .normal)
      } else {
        expandedIndexSet.insert(indexPath.row)
        cell.moreButton.isHidden = true
      }
      self.tableView.reloadRows(at: [indexPath], with: .automatic)
      self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
  }
}

extension RecentViewController: RecentCellDelegate {
  func moreButtonTapped(cell: PostTableViewCell) {
    print("moreButtonTapped")
    let indexPath = tableView.indexPath(for: cell)
    
    if indexPath!.section == 1 {
      if expandedIndexSet.contains(indexPath!.row) {
        expandedIndexSet.remove(indexPath!.row)
        cell.moreButton.setTitle("..더보기", for: .normal)
        print("줄입니다.")
      } else {
        expandedIndexSet.insert(indexPath!.row)
        cell.moreButton.isHidden = true
        print("펼쳐졌습니다.")
      }
    }
    tableView.reloadRows(at: [indexPath!], with: .automatic)
    tableView.scrollToRow(at: indexPath!, at: .bottom, animated: true)
  }
  
  func commentButtonTapped(cell: PostTableViewCell) {
    let indexPath = tableView.indexPath(for: cell)
    guard let detailPostVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailPostVC") as? DetailPostViewController else { return }
    detailPostVC.recentPostIndexPath = indexPath
//    detailPostVC.detailPost = postData
    navigationController?.pushViewController(detailPostVC, animated: true)
  }
  
}
