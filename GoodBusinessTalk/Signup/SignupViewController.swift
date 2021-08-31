//
//  SignupViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/16.
//

import UIKit

class SignupViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  @IBAction func signupBtnTap(_ sender: Any) {
    AuthNetworkManager.register(
      source:
        .register(
          name: nameTextField.text!,
          email: emailTextField.text!,
          password: passwordTextField.text!)) { (result) in
      if result == true {
        self.navigationController?.popViewController(animated: true)
        print("로그인 화면으로 이동하기")
      } else {
        print("이미 있는 이메일주소입니다.")
      }
    }
    
  }
  
  
  
}
