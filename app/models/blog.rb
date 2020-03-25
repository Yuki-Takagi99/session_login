class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { in: 1..140 }
  #contentを確認し、空の値で登録することを禁止する
  #1文字以上140文字以下しか投稿できないようにする
  belongs_to :user
end
