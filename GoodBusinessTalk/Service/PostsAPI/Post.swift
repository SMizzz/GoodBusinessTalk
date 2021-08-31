//
//  Post.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/30.
//

import Foundation

struct Post: Codable {
  var id: String?
  var user: String?
  var name: String?
  var text: String?
  var createdAt: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case user
    case name
    case text
    case createdAt
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    user = try values.decode(String.self, forKey: .user)
    name = try values.decode(String.self, forKey: .name)
    text =  try values.decode(String.self, forKey: .text)
  }
}

struct postsData: Codable {
  var posts: [Post]
}

