//
//  User.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/13.
//

import Foundation

struct User: Codable {
//  var level: String?
//  var id: String?
  var name: String?
//  var email: String?
//  var createdAt: String?
  
  enum Codingkeys: String, CodingKey {
//    case level
//    case id = "_id"
    case name
//    case email
//    case createdAt
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
//    level = try values.decode(String.self, forKey: .level)
//    id = try values.decode(String.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
//    email = try values.decode(String.self, forKey: .email)
//    createdAt = try values.decode(String.self, forKey: .createdAt)
  }
}
