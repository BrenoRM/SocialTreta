class AddUserToPublicacao < ActiveRecord::Migration
  def change
    add_belongs_to :publicacaos, :user
  end
end
