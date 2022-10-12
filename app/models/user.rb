class User < ApplicationRecord
  # before_create :confirmation_token
  rolify

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     User.create! row.to_hash
    end
    end

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     user = find_by_id(row["id"]) || new
  #     user.attributes = row.to_hash.slice(*accessible_attributes)
  #     user.save!
  #   end
  # end
  #
  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then Csv.new(file.path, nil, :ignore)
  #   when ".xls" then Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end





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