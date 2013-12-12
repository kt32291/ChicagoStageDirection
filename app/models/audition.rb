class Audition < ActiveRecord::Base

  has_many :submissions
  has_many :actors, through: :submissions
  belongs_to :company

end
