//
//  PostTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/13.
//

import UIKit

protocol RecentCellDelegate: AnyObject {
  func moreButtonTapped(cell: PostTableViewCell)
  func commentButtonTapped(cell: PostTableViewCell)
}

protocol BestCellDelegate: AnyObject {
  func moreButtonTapped(cell: PostTableViewCell)
  func commentButtonTapped(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
  weak var recentDelegate: RecentCellDelegate?
  weak var bestDelegate: BestCellDelegate?
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var feedDescriptionLabel: UILabel!
  
  @IBOutlet weak var moreButton: UIButton!
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var commentButton: UIButton!
  

  override func awakeFromNib() {
    super.awakeFromNib()
    let background = UIView()
    background.backgroundColor = .clear
    self.selectedBackgroundView = background
    view.layer.masksToBounds = false
    view.layer.shadowColor = UIColor.lightGray.cgColor
    view.layer.shadowOffset = CGSize(width: 1, height: 1)
    view.layer.shadowOpacity = 0.2
    view.layer.shadowRadius = 10
    view.layer.cornerRadius = 30
    levelLabel.layer.masksToBounds = true
    levelLabel.layer.cornerRadius = 10
    moreButton.isHidden = true
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  @IBAction func moreBtnTapped(_ sender: Any) {
    recentDelegate?.moreButtonTapped(cell: self)
    bestDelegate?.moreButtonTapped(cell: self)
  }
  
  @IBAction func commentBtnTapped(_ sender: Any) {
    recentDelegate?.commentButtonTapped(cell: self)
    bestDelegate?.commentButtonTapped(cell: self)
  }
}
