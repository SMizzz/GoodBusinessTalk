//
//  EmailAuth.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/30.
//

import Moya

enum EmailAuthAPI {
  case register(name: String, email: String, password: String)
  case login(email: String, password: String)
  case current(token: String)
}

extension EmailAuthAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: R.BaseURL.baseUrl + "/api/users") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .register(_, _, _):
      return "/register"
    case .login(_, _):
      return "/login"
    case .current(_):
      return "/current"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .register(_, _, _), .login(_, _):
      return .post
    case .current(_):
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .register(let name, let email, let password):
      return .requestParameters(
        parameters: [
          "name": name,
          "email": email,
          "password": password
        ],
        encoding: JSONEncoding.default)
    case .login(let email, let password):
      return .requestParameters(
        parameters: [
          "email": email,
          "password": password
        ],
        encoding: JSONEncoding.default)
    case .current(_):
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .current(let token):
      return ["Authorization": "Bearer \(token)"]
    default:
      return ["Content-Type": "application/json"]
    }
  }

}
