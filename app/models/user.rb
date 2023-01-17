class User < ApplicationRecord
  
  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' 
  validates :nickname,       presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :firstname
    validates :lastname
  end  
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :firstname_kana
    validates :lastname_kana
  end
  validates :birthday,       presence: true
end
