class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :comments
  
  has_many :inquiries
    validates :user_name, presence: true
    validates :password, presence: true, length: { minimum: 2 }
    validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :post_code, presence: true
    validates :phone_number, presence: true
    validates :adress, presence: true  
    validates :email, presence: true, uniqueness: true


  has_many :comment_replies, through: :comments


  #ryo
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy



end
