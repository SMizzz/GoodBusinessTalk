//
//  DetailPostCommentViewModel.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/29.
//

import UIKit

class DetailPostViewModel {
  var postData: Post?
  
  var numberOfSections: Int {
    return 1
  }
  
  func comments(at index: Int) -> Comment {
    return postData!.comment![index]
  }
}
