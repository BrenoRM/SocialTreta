class AddUserToComment < ActiveRecord::Migration

  def change
    add_belongs_to :comments, :user
  end

end