class Submission < ActiveRecord::Base
  validates_uniqueness_of :audition_id, :scope => :actor_id
  belongs_to :actor
  belongs_to :audition
end
