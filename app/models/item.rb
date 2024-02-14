class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_paid_by
  belongs_to :origin_region
  belongs_to :shipping_day

  has_one_attached :image

  validates :name, :description, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_paid_by_id, :origin_region_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be an integer greater than 300 and less than 9999999' }
end