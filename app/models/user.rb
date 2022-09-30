class User < ApplicationRecord
  rolify
  has_many :comments, dependent: :destroy

  has_many :articles, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
