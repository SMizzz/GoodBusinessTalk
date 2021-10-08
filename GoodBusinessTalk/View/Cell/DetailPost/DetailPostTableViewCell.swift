//
//  DetailPostTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/23.
//

import UIKit

protocol DetailPostCellDelegate: AnyObject {
  func likeButtonTapped(cell: DetailPostTableViewCell)
}

class DetailPostTableViewCell: UITableViewCell {
  
  weak var delegate: DetailPostCellDelegate?
  
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
    
    levelTitleLabel.layer.masksToBounds = true
    levelTitleLabel.layer.cornerRadius = 10
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func update(post: Post) {
    nicknameLabel.text = post.name
    levelTitleLabel.text = post.user?.level
    dateLabel.text = post.createdAt
    feedDescriptionLabel.text = post.text
  }
  
  @IBAction func likeBtnTap(_ sender: Any) {
    delegate?.likeButtonTapped(cell: self)
  }
  
  
}
