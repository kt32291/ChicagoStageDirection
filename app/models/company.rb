class Company < ActiveRecord::Base

  has_many :associates
  has_many :auditions

end
