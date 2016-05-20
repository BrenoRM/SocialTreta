class AddUserToProfile < ActiveRecord::Migration

  def change
    add_belongs_to :profiles, :user
  end

end
