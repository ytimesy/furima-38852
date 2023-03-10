class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one   :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :deliveryfee_type
  belongs_to :prefecture
  belongs_to :delivery_when

  validates :image,               presence: true
  validates :name,                presence: true
  validates :content,             presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :deliveryfee_type_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_when_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :itemfee,             presence: true, format: { with: /\A[0-9]+\z/ }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
