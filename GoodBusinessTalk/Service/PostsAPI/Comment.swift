//
//  Comment.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/06.
//

import Foundation

struct Comment: Codable {
  var user: String?
  var text: String?
  var name: String?
  var id: String?
  var date: String?
  
  enum CodingKeys: String, CodingKey {
    case user
    case text
    case name
    case id = "_id"
    case date
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    user = try values.decodeIfPresent(String.self, forKey: .user)
    text = try values.decodeIfPresent(String.self, forKey: .text)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    id = try values.decodeIfPresent(String.self, forKey: .id)
    date = try values.decodeIfPresent(String.self, forKey: .date)
  }
}
