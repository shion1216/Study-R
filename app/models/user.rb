class User < ApplicationRecord
  
  #パスワード空白・文字数・ローマ字数字
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
  validates :password, presence: true, format: {with: VALID_PASSWORD_REGEX}
  
  
  #名前空白・長さ
  validates :name, presence: true, length:{maximum: 15}
  
  #メアド空白・~@~.~ になってるはず？
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  
  
  has_secure_password
  
  has_many :calendars
end
