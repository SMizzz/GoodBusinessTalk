//
//  PostsAPI.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/30.
//

import Moya

enum PostsAPI {
  case allPosts
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
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .allPosts:
      return .get
    default:
      return .post
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
