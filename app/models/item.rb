class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :item_name

    validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id,
              numericality: { other_than: 0, message: "can't be blank" }
    validates :price, numericality: { 
      only_integer: true, 
      greater_than_or_equal_to: 300, 
      less_than_or_equal_to: 9_999_999 
    }

    validates :price, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999
    }

  end

  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id,
            numericality: { other_than: 0, message: "can't be blank" }
end
