//
//  BestViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/17.
//

import UIKit

class BestViewController: UIViewController {
  
  var postData = [
    Post(
      nickName: "오즈",
      levelTitle: "인턴",
      date: "2021-08-11 13:10",
      feedDescriptionLabel: "퇴사했습니다!!!"),
    Post(
      nickName: "윌",
      levelTitle: "사원",
      date: "2021-08-11 14:50",
      feedDescriptionLabel: "안녕하세요. 3년간 회사 다니고 쉬다가 회사 이직할라고 최근에 공고 넣고 있는데 일주일전에 넣은 회사가 지금 이 시간에 연락이 왔습니다;; 전화는 안 오고 저 문자 딸랑왔는데 거르는게 맞을까요?"),
    Post(
      nickName: "네로",
      levelTitle: "부장",
      date: "2021-08-10 13:20",
      feedDescriptionLabel: "혹시 포토 어씨던트부터 메인 작가까지 되신 분 계시나요?\n어씨던트 8개월 차인데\n주 5일 하루 13~14시간 근무\n쉬는 시간 X\n월급 식대 포함 150\n4대 보험 x\n쉬는날 매주 랜덤\n점심시간 촬영 옷 갈아입는동안 10분컷\n배우고 있다지만 8개월동안 하루하루가 멘탈 싸움이네요")
  ]
  
  var expandedIndexSet: IndexSet = []
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
  
}

extension BestViewController:
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
    } else if section == 1 {
      return postData.count
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
      cell.bestDelegate = self
      let posts = postData[indexPath.row]
      cell.nicknameLabel.text = posts.nickName
      cell.levelLabel.text = posts.levelTitle
      cell.dateLabel.text = posts.date
      cell.feedDescriptionLabel.text = posts.feedDescriptionLabel
      
      if posts.feedDescriptionLabel.count > 110 {
        cell.moreButton.isHidden = false
        if expandedIndexSet.contains(indexPath.row) {
          cell.feedDescriptionLabel.numberOfLines = 0
          cell.moreButton.isHidden = true
        } else {
          cell.moreButton.isHidden = false
          cell.moreButton.setTitle("..더보기", for: .normal)
        }
      } else {
        cell.feedDescriptionLabel.numberOfLines = 4
        cell.moreButton.isHidden = true
      }
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

extension BestViewController: BestCellDelegate {
  func moreButtonTapped(cell: PostTableViewCell) {
    let indexPath = tableView.indexPath(for: cell)
    
    if indexPath!.section == 1 {
      if expandedIndexSet.contains(indexPath!.row) {
        expandedIndexSet.remove(indexPath!.row)
        cell.moreButton.setTitle("..더보기", for: .normal)
        print("줄입니다.")
      } else {
        expandedIndexSet.insert(indexPath!.row)
        cell.moreButton.isHidden = true
//        cell.moreButton.setTitle("", for: .normal)
        print("펼쳐졌습니다.")
      }
    }
    tableView.reloadRows(at: [indexPath!], with: .automatic)
    tableView.scrollToRow(at: indexPath!, at: .bottom, animated: true)
  }
  
  func commentButtonTapped(cell: PostTableViewCell) {
    let indexPath = tableView.indexPath(for: cell)
    guard let detailPostVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailPostVC") else { return }
  }
}
