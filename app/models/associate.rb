class Associate < ActiveRecord::Base

  has_many :auditions, through: :company
  has_many :submissions, through: :auditions
  has_one :company

  validates_presence_of :name, :title, :company_id, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

end
