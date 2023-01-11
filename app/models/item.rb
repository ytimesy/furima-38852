class Item < ApplicationRecord
  belongs_to :user

  validates :name,                presence: true
  validates :content,             presence: true
  validates :category_id,         presence: true
  validates :status_id,           presence: true
  validates :deliveryfee_type_id, presence: true
  validates :prefecture_id,       presence: true
  validates :delivery_when_id,    presence: true
end
