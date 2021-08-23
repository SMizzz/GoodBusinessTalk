//
//  DetailPostTextViewTableViewCell.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/08/23.
//

import UIKit

protocol DetailPostTextViewDelegate: AnyObject {
  func updateTextViewHeight(
    _ cell: DetailPostTextViewTableViewCell,
    _ textView: UITextView)
}

class DetailPostTextViewTableViewCell: UITableViewCell {
  
  weak var delegate: DetailPostTextViewDelegate?
  
  @IBOutlet weak var whiteBGView: UIView!
  @IBOutlet weak var commentTextView: UITextView!
  @IBOutlet weak var sendButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureWhiteBGView()
    setTextView()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func configureWhiteBGView() {
    whiteBGView.layer.cornerRadius = 15
    whiteBGView.layer.shadowColor = UIColor.lightGray.cgColor
    whiteBGView.layer.shadowOffset = CGSize(width: 1, height: 1)
    whiteBGView.layer.shadowOpacity = 0.2
    whiteBGView.layer.shadowRadius = 15
  }
  
  func setTextView() {
    commentTextView.text = "댓글달기..."
    commentTextView.textColor = UIColor.lightGray
    commentTextView.layer.cornerRadius = 20
    commentTextView.delegate = self
    commentTextView.isScrollEnabled = false
    commentTextView.sizeToFit()
  }
  
}

extension DetailPostTextViewTableViewCell: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    commentTextView.text = ""
    commentTextView.textColor = .black
  }
  
  func textViewDidChange(_ textView: UITextView) {
    if let delegate = delegate {
      delegate.updateTextViewHeight(self, commentTextView)
    }
  }
}
