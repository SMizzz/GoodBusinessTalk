//
//  PostsNetworkManager.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/04.
//

import Moya
import SwiftyJSON
import ProgressHUD

class PostsNetworkManager {
  static let provider = MoyaProvider<PostsAPI>()
  static func getAllPosts(
    source: PostsAPI,
    completion: @escaping([Post]) -> ()
  ) {
    ProgressHUD.show()
    provider.request(.allPosts) { (result) in
      switch result {
      case .success(let res):
        do {
          let postData = try JSONDecoder().decode([Post].self, from: res.data)
          completion(postData)
          ProgressHUD.dismiss()
        } catch let err {
          print(err)
          return
        }
      case .failure(let err):
        ProgressHUD.dismiss()
        print(err.localizedDescription)
        return
      }
    }
  }
  
  static func postRegister(
    source: PostsAPI,
    completion: @escaping(Bool) -> ()
  ) {
    provider.request(source) { (result) in
      switch result {
      case .success(let res):
        print(res)
        do {
//          let postData = try JSONDecoder().decode(Post.self, from: res.data)
          completion(true)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
  
  static func getDetailPost(
    source: PostsAPI,
    completion: @escaping(Post) -> ()
  ) {
    provider.request(source) { (result) in
      switch result {
      case .success(let res):
        do {
          let detailPostData = try JSONDecoder().decode(Post.self, from: res.data)
          completion(detailPostData)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err)
        return
      }
    }
  }
  
  static func postComment(
    source: PostsAPI,
    completion: @escaping(Post) -> ()
  ) {
    provider.request(source) { (result) in
      switch result {
      case .success(let res):
        do {
          let addComment = try JSONDecoder().decode(Post.self, from: res.data)
          completion(addComment)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}

