class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true, uniqueness: true, length: {maximum: 16}, format: { with: /\A[^ |　]+\z/, message: 'にスペースは入力できません' }
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$\z/ }

end
