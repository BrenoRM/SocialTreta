class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nome
      t.string :partido
      t.string :cidade
      t.string :estado
      t.string :nivel_de_treta
      t.string :estado_civil
      t.string :formacao
      t.string :data_nascimento

      t.timestamps null: false
    end
  end
end
