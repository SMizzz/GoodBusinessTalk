//
//  AlarmViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/20.
//

import UIKit
import Tabman
import Pageboy

class NoticeViewController: TabmanViewController {
  
  private var viewControllers: Array<UIViewController> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SpoqaHanSans-Bold", size: 18)!]
    navigationController?.navigationBar.barTintColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
  }
  
  func viewSetup() {
    let postNoticeVC = self.storyboard?.instantiateViewController(withIdentifier: "PostNoticeVC")
    let appNoticeVC = self.storyboard?.instantiateViewController(withIdentifier: "AppNoticeVC")
    
    viewControllers.append(postNoticeVC!)
    viewControllers.append(appNoticeVC!)
    self.dataSource = self
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    bar.layout.contentMode = .intrinsic
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 55)
    bar.layout.interButtonSpacing = 25
    bar.layout.transitionStyle = .snap
    bar.indicator.weight = .light
    bar.indicator.tintColor = .black
    bar.buttons.customize { (button) in
      button.tintColor = .darkGray
      button.selectedTintColor = .black
      button.font = UIFont(name: "SpoqaHanSans-Bold", size: 17)!
    }
    addBar(bar, dataSource: self, at: .top)
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}

extension NoticeViewController:
  PageboyViewControllerDataSource,
  TMBarDataSource {
  func numberOfViewControllers(
    in pageboyViewController: PageboyViewController
  ) -> Int {
    return viewControllers.count
  }
  
  func viewController(
    for pageboyViewController: PageboyViewController,
    at index: PageboyViewController.PageIndex
  ) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(
    for pageboyViewController: PageboyViewController
  ) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(
    for bar: TMBar,
    at index: Int
  ) -> TMBarItemable {
    let item = TMBarItem(title: "")
    if (index == 0) {
      item.title = "알림내역"
    } else if (index == 1) {
      item.title = "공지사항"
    }
    return item
  }
}
