//
//  PostTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/13.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var feedDescriptionLabel: UILabel!
  
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var commentButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    view.layer.masksToBounds = false
    view.layer.shadowColor = UIColor.lightGray.cgColor
    view.layer.shadowOffset = CGSize(width: 1, height: 1)
    view.layer.shadowOpacity = 0.2
    view.layer.shadowRadius = 10
    view.layer.cornerRadius = 30
    levelLabel.layer.masksToBounds = true
    levelLabel.layer.cornerRadius = 10
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
