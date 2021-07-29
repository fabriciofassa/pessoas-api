class CreateContatos < ActiveRecord::Migration[6.1]
  def change
    create_table :contatos do |t|
      t.integer :tipo
      t.string :valor
      t.integer :pessoa_id

      t.timestamps
    end
  end
end
