//
//  SettingViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/20.
//

import UIKit

class SettingViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var settingInform = ["버전정보", "계정"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
 
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: "SettingProfileTableViewCell", bundle: nil),
      forCellReuseIdentifier: "SettingProfileTableViewCell")
  }
  
}

extension SettingViewController:
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
      return settingInform.count
    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "SettingProfileTableViewCell",
        for: indexPath) as! SettingProfileTableViewCell
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SettingDetailTableViewCell", for: indexPath)
      let informData = settingInform[indexPath.row]
      if indexPath.row == 0 {
        cell.textLabel?.text = informData
        cell.detailTextLabel?.text = "최신정보입니다."
        cell.accessoryType = .none
      } else {
        cell.textLabel?.text = informData
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
      return 95.0
    } else if indexPath.section == 1 {
      return 50.0
    }
    return 0
  }

}
