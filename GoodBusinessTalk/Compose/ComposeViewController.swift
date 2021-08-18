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
  
  @objc func handleUploadButton() {
    print("upload button tapped!")
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
}
