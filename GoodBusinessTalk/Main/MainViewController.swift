//
//  MainViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/12.
//

import UIKit
import Tabman
import Pageboy

class MainViewController: TabmanViewController {
  
  private var viewControllers: Array<UIViewController> = []
  
  @IBOutlet weak var composeBackgroundView: UIView!
  @IBOutlet weak var composeTextField: UITextField!
  @IBOutlet weak var composeButton: UIButton!
  @IBOutlet weak var tabmanView: UIView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(UserDefaults.standard.string(forKey: "token")!)
    navigationBarView()
    configureTextField()
    configureComposeView()
    viewSetup()
  }
  
  private func navigationBarView() {
    navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  private func configureTextField() {
    composeTextField.delegate = self
  }
  
  func viewSetup() {
    let recentVC = self.storyboard?.instantiateViewController(withIdentifier: "RecentVC")
    let bestVC = self.storyboard?.instantiateViewController(withIdentifier: "BestVC")
    
    viewControllers.append(recentVC!)
    viewControllers.append(bestVC!)
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
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
    addBar(bar, dataSource: self, at: .custom(view: tabmanView, layout: nil))
  }
  
  private func configureComposeView() {
    composeButton.layer.masksToBounds = true
    
    composeBackgroundView.layer.cornerRadius = 25
    composeButton.layer.cornerRadius = 15
    
    composeBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
    composeBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
    composeBackgroundView.layer.shadowOpacity = 0.15
    composeBackgroundView.layer.shadowRadius = 20
  }
  
  @IBAction func alarmBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let noticeVC = mainSB.instantiateViewController(withIdentifier: "NoticeVC")
    navigationController?.pushViewController(noticeVC, animated: true)
  }
  @IBAction func settingBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let settingVC = mainSB.instantiateViewController(withIdentifier: "SettingVC")
    navigationController?.pushViewController(settingVC, animated: true)
  }
  
}

extension MainViewController:
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
  
  func barItem(for bar: TMBar, at index: Int
  ) -> TMBarItemable {
    let item = TMBarItem(title: "")
    if (index == 0) {
      item.title = "최근"
    } else if (index == 1) {
      item.title = "인기"
    }
    return item
  }
}

extension MainViewController: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    composeTextField.resignFirstResponder()
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let composeVC = mainSB.instantiateViewController(withIdentifier: "ComposeVC")
    navigationController?.pushViewController(composeVC, animated: true)
  }
}
