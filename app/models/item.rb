class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shpping_fee_paid_by
  belongs_to :origin_region
  belongs_to :shipping_day

  has_one_attached :image

  validates :name, :description, presence: true

  validates :category_id, :condition_id, :shipping_fee_paid_by_id, :origin_region_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
end