class Audition < ActiveRecord::Base

  belongs_to :company
  has_many :submissions
  has_many :actors, through: :submissions

end
