//
//  Likes.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/06.
//

import Foundation

struct Like: Codable {
  var user: String?
  var id: String?
  
  enum CodingKeys: String, CodingKey {
    case user
    case id = "_id"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    user = try values.decode(String.self, forKey: .user)
    id = try values.decode(String.self, forKey: .id)
  }
}
