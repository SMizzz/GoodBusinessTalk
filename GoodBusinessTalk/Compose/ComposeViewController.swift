//
//  ComposeViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/12.
//

import UIKit

class ComposeViewController: UIViewController {
  
  @IBOutlet weak var feedTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBarItem()
    configureFeedTextView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    configureNavigationBar()
  }
  
  private func configureNavigationBar() {
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .white
  }
  
  private func configureNavigationBarItem() {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "upload"), for: .normal)
    button.addTarget(
      self,
      action: #selector(handleUploadButton),
      for: .touchUpInside)
    
    button.frame = CGRect(x: 0, y: 0, width: 55, height: 53)
    let barButton = UIBarButtonItem(customView: button)
    self.navigationItem.rightBarButtonItem = barButton
  }
  
  private func configureFeedTextView() {
    feedTextView.autocorrectionType = .no
  }
  
  @objc func handleUploadButton() {
    guard let token = UserDefaults.standard.string(forKey: "token") else { return }
    PostsNetworkManager.postRegister(
      source: .postRegister(name: "미지", text: feedTextView.text!, token: token)) { (result) in
      if result == true {
        let alertVC = UIAlertController(title: "등록 완료", message: "등록되었습니다.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default) { (_) in
          if let navi = self.navigationController {
            navi.popViewController(animated: true)
          }
        }
        alertVC.addAction(okBtn)
        self.present(alertVC, animated: true, completion: nil)
      }
    }
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
}
