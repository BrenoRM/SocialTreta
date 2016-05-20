class AddPublicacaoToComment < ActiveRecord::Migration

  def change
    add_belongs_to :comments, :publicacao
  end

end
