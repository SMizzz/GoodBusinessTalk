//
//  PostsAPI.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/30.
//

import Moya

enum PostsAPI {
  case allPosts
  case detailPost(id: String, token: String)
  case postRegister(name: String, text: String, token: String)
  case addComment(id: String, name: String, text: String, token: String)
}

extension PostsAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: R.BaseURL.baseUrl + "/api/posts") else {
      fatalError("url error")
    }
    return url
  }
  
  var path: String {
    switch self {
    case .allPosts:
      return "/total"
    case .detailPost(let id, _):
      return "/\(id)"
    case .postRegister(_, _, _):
      return "/"
    case .addComment(let id, _, _, _):
      return "/comment/\(id)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .allPosts, .detailPost(_, _):
      return .get
    case .postRegister(_, _, _), .addComment(_, _, _, _):
      return .post
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .allPosts:
      return .requestPlain
    case .detailPost(_, _):
      return .requestPlain
    case .postRegister(let name, let text, _):
      return .requestParameters(
        parameters: ["name": name, "text": text],
        encoding: JSONEncoding.default)
    case .addComment(_, let name, let text, _):
      return .requestParameters(
        parameters: ["name": name, "text": text],
        encoding: JSONEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .allPosts:
      return ["Content-Type": "application/json"]
    case .detailPost(_, let token), .postRegister(_, _, let token), .addComment(_, _, _, let token):
      return ["Authorization": "Bearer \(token)"]
    }
  }
}
