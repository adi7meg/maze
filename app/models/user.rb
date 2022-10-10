class User < ApplicationRecord
  # before_create :confirmation_token
  rolify

  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
    end
  end

  validates :phone, :presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 10 }



  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :articles, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable
  # validates :body, presence: true, length: { minimum: 10 }
end

def email_activate
  self.email_confirmed = true
  self.confirm_token = nil
  save!(:validate => false)
end

# private
# def confirmation_token
#   if self.confirm_token.blank?
#     self.confirm_token = SecureRandom.urlsafe_base64.to_s
#   end
# end