class EndUser < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  # accepts_nested_attributes_for :addresses

  def cart_total_price
    total_price = 0
    self.cart_products.each do |cart_product|
      total_price += cart_product.product.amount * cart_product.quantity
    end
    return total_price
  end


end
