//
//  DetailPostCommentTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/23.
//

import UIKit

class DetailPostCommentTableViewCell: UITableViewCell {
  
  @IBOutlet weak var commnetView: UIView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var levelTitleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var commentContentLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureLabelView()
    configureBGView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func update(comment: Comment) {
    nicknameLabel.text = comment.name
    levelTitleLabel.text = "사원"
    dateLabel.text = comment.date
    commentContentLabel.text = comment.text
  }
  
  func configureBGView() {
    commnetView.layer.cornerRadius = 20
    commnetView.layer.shadowColor = UIColor.lightGray.cgColor
    commnetView.layer.shadowOffset = CGSize(width: 1, height: 1)
    commnetView.layer.shadowOpacity = 0.2
    commnetView.layer.shadowRadius = 15
    
    levelTitleLabel.layer.masksToBounds = true
    levelTitleLabel.layer.cornerRadius = 10
  }
  
  func configureLabelView() {
    levelTitleLabel.layer.cornerRadius = 10
  }
  
}
