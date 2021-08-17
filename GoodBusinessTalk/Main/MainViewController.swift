//
//  MainViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/12.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var composeTextField: UITextField!
  @IBOutlet weak var composeButton: UIButton!
  
  
  
  var postData = [
    Post(nickName: "잠보", levelTitle: "인턴", date: "2021.08.09 18:27", feedDescriptionLabel: "회사 다니는 이유가 뭔가요? \n1. 월급 주니까 \n2. 로또 안 맞아서 \n3. 일이 맘에 들어서"),
    Post(nickName: "미지의세계", levelTitle: "사원", date: "2021.08.09 18:27", feedDescriptionLabel: "안녕하세요. 3년간 회사 다니고 쉬다가 회사 이직할라고 최근에 공고 넣고 있는데\n일주일전에 넣은 회사가 지금 이 시간에 연락이 왔습니다;;\n전화는 안 오고 저 문자 딸랑왔는데 거르는게 맞을까요?"),
    Post(nickName: "오즈", levelTitle: "부장", date: "2021.08.11 12:23", feedDescriptionLabel: "퇴사했습니다!!!")
  ]
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureButton()
    configureTableView()
    composeTextField.delegate = self
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    tableView.estimatedRowHeight = 235
    tableView.rowHeight = UITableView.automaticDimension
    
  }

  
  private func configureButton() {
    composeButton.layer.masksToBounds = true
    composeButton.layer.cornerRadius = 15
  }
}

extension MainViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let composeVC = mainSB.instantiateViewController(withIdentifier: "ComposeVC")
    navigationController?.pushViewController(composeVC, animated: true)
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return postData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
  
  
//  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else { return }
//  }
  
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
  }
}

