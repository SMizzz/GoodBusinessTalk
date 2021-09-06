//
//  PostsNetworkManager.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/04.
//

import Moya
import SwiftyJSON

class PostsNetworkManager {
  static let provider = MoyaProvider<PostsAPI>()
  static func getAllPosts(
    source: PostsAPI,
    completion: @escaping([Post]) -> ()
  ) {
    provider.request(.allPosts) { (result) in
      switch result {
      case .success(let res):
        do {
          let postData = try JSONDecoder().decode([Post].self, from: res.data)
          completion(postData)
        } catch let err {
          print(err)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}

