//
//  LogoutViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/06.
//

import UIKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func logoutBtnTap(_ sender: Any) {
    UserDefaults.standard.removeObject(forKey: "token")
    let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
    wnd?.rootViewController = loginVC
    
  }
  
}
