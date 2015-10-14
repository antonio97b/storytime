class Contribution < ActiveRecord::Base
  belongs_to :story

  validates :username, :presence => true
  validates :sentence, :presence => true
end
