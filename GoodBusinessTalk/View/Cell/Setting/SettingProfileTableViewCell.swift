//
//  SettingProfileTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/20.
//

import UIKit

class SettingProfileTableViewCell: UITableViewCell {
  @IBOutlet weak var bgView: UIView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var levelTitleLabel: UILabel!
  @IBOutlet weak var levelStandardButton: UIButton!
  @IBOutlet weak var myPostCountLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    bgView.layer.cornerRadius = 25
    levelTitleLabel.layer.masksToBounds = true
    levelTitleLabel.layer.cornerRadius = 10
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
