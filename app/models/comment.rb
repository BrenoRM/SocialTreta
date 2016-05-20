class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :publicacao

  validates_presence_of :text
  validates_length_of :text, minimum: 1, maximum: 150

end
