//
//  Post.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/30.
//

import Foundation

struct Post: Codable {
  var id: String? = ""
  var user: User?
  var name: String? = ""
  var text: String? = ""
  var likes: [Like]?
  var comment: [Comment]?
  var createdAt: String? = ""
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case user
    case name
    case text
    case likes
    case comment
    case createdAt
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    user = try values.decode(User.self, forKey: .user)
    name = try values.decode(String.self, forKey: .name)
    text =  try values.decode(String.self, forKey: .text)
    likes = try values.decode([Like].self, forKey: .likes)
    comment = try values.decode([Comment].self, forKey: .comment)
    createdAt = try values.decode(String.self, forKey: .createdAt)
  }
}

