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
    tableView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
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
    return 0
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
      cell.textLabel?.font = UIFont(name: "SpoqaHanSans-Bold", size: 13)
      cell.detailTextLabel?.font = UIFont(name: "SpoqaHanSans-Regular", size: 13)
      if indexPath.row == 0 {
        cell.textLabel?.text = informData
        cell.detailTextLabel?.text = "최신버전입니다."
        cell.accessoryType = .none
      } else {
        cell.textLabel?.text = informData
        cell.detailTextLabel?.text = ""
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
      return 100.0
    } else if indexPath.section == 1 {
      return 50.0
    }
    return 0
  }
  
  func tableView(
    _ tableView: UITableView,
    viewForFooterInSection section: Int
  ) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
    view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    return view
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForFooterInSection section: Int
  ) -> CGFloat {
    if section == 0 {
      return 30
    }
    return 0
  }

}
