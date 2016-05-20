class Publicacao < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :text
  validates_length_of :text, minimum: 1, maximum: 300
end
