class User < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  attr_writer :username
  has_one_attached :avatar
  validates :name, presence: true
  validates :avatar, presence: true
  validates :surname, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
