class Profile < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :nome, :data_nascimento
  validates_length_of :data_nascimento, minimum: 8, maximum: 10

end
