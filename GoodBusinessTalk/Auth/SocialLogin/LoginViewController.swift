//
//  LoginViewController.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/16.
//

import UIKit
import GoogleSignIn
import AuthenticationServices

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var appleSignInButton: UIButton!
  @IBOutlet weak var googleSignInButton: GIDSignInButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //    setAppleSignInButton()
    setGoogleSignInButton()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func appleLoginBtnTap(_ sender: Any) {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]
    
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
  }
  
  @IBAction func googleSignInBtnTap(_ sender: Any) {
    GIDSignIn.sharedInstance().signIn()
  }
  
  func setGoogleSignInButton() {
    GIDSignIn.sharedInstance()?.presentingViewController = self
    GIDSignIn.sharedInstance().delegate = self
    
  }
  
  //  func setAppleSignInButton() {
  //      let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
  //      authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
  //      self.appleSignInButton.addSubview(authorizationButton)
  //  }
  
  @objc func appleSignInButtonPress() {
    
  }
  
  @IBAction func signupBtnTap(_ sender: Any) {
    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let signupVC = mainSB.instantiateViewController(withIdentifier: "SignupVC")
    navigationController?.pushViewController(signupVC, animated: true)
  }
  
  @IBAction func loginBtnTap(_ sender: Any) {
    AuthNetworkManager.login(source: .login(email: emailTextField.text!, password: passwordTextField.text!)) { (result) in
      UserDefaults.standard.set(result, forKey: "token")
      let wnd = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
      let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
      wnd?.rootViewController = mainVC
    }
  }
  
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return self.view.window!
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
    // Apple ID
    case let appleIDCredential as ASAuthorizationAppleIDCredential:
      
      // 계정 정보 가져오기
      let userIdentifier = appleIDCredential.user
      let fullName = appleIDCredential.fullName
      let email = appleIDCredential.email
      
      print("User ID : \(userIdentifier)")
      print("User Email : \(email ?? "")")
      print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
      
    default:
      break
    }
  }
  
  // Apple ID 연동 실패 시
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
  }
  
}

extension LoginViewController: GIDSignInDelegate {
  func sign(
    _ signIn: GIDSignIn!,
    didSignInFor user: GIDGoogleUser!,
    withError error: Error!
  ) {
    if let error = error {
      if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
        print("The user has not signed in before or they have since signed out.")
      } else {
        print("\(error.localizedDescription)")
      }
      return
    }
    
    // 사용자 정보 가져오기
    if let userId = user.userID,                  // For client-side use only!
       let idToken = user.authentication.idToken, // Safe to send to the server
       let fullName = user.profile.name,
       let givenName = user.profile.givenName,
       let familyName = user.profile.familyName,
       let email = user.profile.email {
      
      print("Token : \(idToken)")
      print("User ID : \(userId)")
      print("User Email : \(email)")
      print("User Name : \((fullName))")
      
    } else {
      print("Error : User Data Not Found")
    }
  }
  
  func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    print("Disconnect")
  }
}
