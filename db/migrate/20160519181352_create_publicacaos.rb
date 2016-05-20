class CreatePublicacaos < ActiveRecord::Migration
  def change
    create_table :publicacaos do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
