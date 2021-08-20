//
//  AppNoticeTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/20.
//

import UIKit

class AppNoticeTableViewCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var moreButton: UIButton!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
