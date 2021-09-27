//
//  MainPostViewModel.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/27.
//

import UIKit

class MainPostViewModel {
  var postData = [Post]()
  
  var numberOfSections: Int {
    return postData.count
  }
  
  func posts(at index: Int) -> Post {
    return postData[index]
  }
}
