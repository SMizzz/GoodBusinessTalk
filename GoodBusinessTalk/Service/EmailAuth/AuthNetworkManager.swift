//
//  AuthNetworkManager.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/30.
//

import Moya
import SwiftyJSON

class AuthNetworkManager {
  static let provider = MoyaProvider<EmailAuthAPI>()
  static func register(
    source: EmailAuthAPI,
    completion: @escaping(Bool)->()) {
    provider.request(source, completion: { (result) in
      switch result {
      case .success(let res):
        if res.statusCode == 200 {
          completion(true)
        } else {
          completion(false)
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    })
  }
  
  static func login(
    source: EmailAuthAPI,
    completion: @escaping(String)->()) {
    provider.request(source, completion: { (result) in
      switch result {
      case .success(let res):
        let jsonData = JSON(res.data)
        if jsonData["token"].string != nil {
          completion(jsonData["token"].string!)
        } else {
          completion("로그인 실패")
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    })
  }
}
