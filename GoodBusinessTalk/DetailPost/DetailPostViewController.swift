//
//  DetailPostViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/23.
//

import UIKit

class DetailPostViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var id: String = ""
  var postData: Post?
  var commentData: Post?
  private let token = UserDefaults.standard.string(forKey: "token")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.barTintColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    configureTableView()
    getData()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = 240
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(
      UINib(nibName: "DetailPostTableViewCell", bundle: nil),
      forCellReuseIdentifier: "DetailPostTableViewCell")
    tableView.register(
      UINib(nibName: "DetailPostTextViewTableViewCell", bundle: nil),
      forCellReuseIdentifier: "DetailPostTextViewTableViewCell")
    tableView.register(
      UINib(nibName: "DetailPostCommentTableViewCell", bundle: nil),
      forCellReuseIdentifier: "DetailPostCommentTableViewCell")
  }
  
  private func getData() {
    PostsNetworkManager.getDetailPost(source: .detailPost(id: id, token: token!)) { (post) in
      self.postData = post
      self.tableView.reloadData()
    }
    
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
}

extension DetailPostViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 3
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return 1
    } else if section == 2 {
      return postData?.comment!.count ?? 0
    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPostTableViewCell", for: indexPath) as! DetailPostTableViewCell
      cell.nicknameLabel.text = postData?.name
      cell.levelTitleLabel.text = postData?.user?.level
      cell.dateLabel.text = postData?.createdAt
      cell.feedDescriptionLabel.text = postData?.text
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPostTextViewTableViewCell", for: indexPath) as! DetailPostTextViewTableViewCell
      cell.delegate = self
      return cell
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPostCommentTableViewCell", for: indexPath) as! DetailPostCommentTableViewCell
    let comment = postData?.comment![indexPath.row]
    cell.nicknameLabel.text = comment?.name
    cell.levelTitleLabel.text = "인턴"
    cell.dateLabel.text = comment?.date
    cell.commentContentLabel.text = comment?.text
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 2 {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
      view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
      let label = UILabel(frame: CGRect(x: 22, y: 4, width: view.bounds.size.width, height: view.bounds.size.height))
      label.textColor = .darkGray
      label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      label.font = UIFont(name: "SpoqaHans-Regular", size: 8)
      if let commentCount = postData?.comment!.count {
        label.text = "댓글 \(commentCount)개"
      }
      
      view.addSubview(label)
      
      return view
    }
    let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    return view
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 2 {
      return 40
    }
    return 0
  }
  
}

extension DetailPostViewController: DetailPostTextViewDelegate {
  
  func updateTextViewHeight(
    _ cell: DetailPostTextViewTableViewCell,
    _ textView: UITextView) {
    let size = textView.bounds.size
    let newSize = tableView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))
    if size.height != newSize.height {
      UIView.setAnimationsEnabled(false)
      tableView.beginUpdates()
      tableView.endUpdates()
      UIView.setAnimationsEnabled(true)
    }
  }
  
  
  func textViewToDetailPostVC(_ text: String) {
    PostsNetworkManager.postComment(
      source: .addComment(
        id: id,
        name: "noze",
        text: text,
        token: token!)
    ) { (post) in
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
  }
  
}
