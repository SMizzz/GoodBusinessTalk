//
//  DetailPostTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/23.
//

import UIKit

class DetailPostTableViewCell: UITableViewCell {

  @IBOutlet weak var detailPostView: UIView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var levelTitleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var feedDescriptionLabel: UILabel!
  
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var commentButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    detailPostView.layer.cornerRadius = 20
    detailPostView.layer.shadowColor = UIColor.lightGray.cgColor
    detailPostView.layer.shadowOffset = CGSize(width: 1, height: 1)
    detailPostView.layer.shadowOpacity = 0.1
    detailPostView.layer.shadowRadius = 15
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
