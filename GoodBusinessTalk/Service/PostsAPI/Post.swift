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
  var likes: [Likes]?
  var comment: [Comment]?
  var createdAt: String?
  
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
    user = try values.decodeIfPresent(String.self, forKey: .user)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    text =  try values.decodeIfPresent(String.self, forKey: .text)
    likes = try values.decodeIfPresent(Array.self, forKey: .likes)
    comment = try values.decodeIfPresent(Array.self, forKey: .comment)
    createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
  }
}

