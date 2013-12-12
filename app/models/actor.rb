class Actor < ActiveRecord::Base

  has_many :submissions
  has_many :auditions, through: :submissions

  validates_presence_of :first_name, :last_name, :headshot, :resume, :equity, :height, :weight, :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  mount_uploader :headshot, HeadshotUploader
  mount_uploader :resume, ResumeUploader

end
