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
}
