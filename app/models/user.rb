class User < ApplicationRecord
  
  #パスワード空白・文字数・ローマ字数字
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
  validates :password, presence: {message: 'を正しい形で入力してください。'}, format: {with: VALID_PASSWORD_REGEX ,message: 'は半角英大文字・半角英子文字・数字を全て含む、８～３２文字で入力してください。'}
  
  
  #名前空白・長さ
  validates :name, presence: { message: 'は１文字以上１５文字以内で入力してください。' }, length:{maximum: 15}
  
  #メアド空白・~@~.~ になってるはず？
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX , message: '正しい形で入力してください。'}
  
  
  has_secure_password
  
  has_many :calendars
end
