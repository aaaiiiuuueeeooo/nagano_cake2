class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end
  
  def with_tax_price
    (price*1.1).floor
  end 
end
