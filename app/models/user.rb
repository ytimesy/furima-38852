class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A[a-z\d]{6,}\z/i
  validates :password,       presence: true, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  validates :nickname,       presence: true
  validates :firstname,      presence: true
  validates :lastname,       presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana,  presence: true
  validates :birthday,       presence: true
end
