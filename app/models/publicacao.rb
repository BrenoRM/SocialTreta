class Publicacao < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :text
  validates_length_of :text, minimum: 1, maximum: 300
end
