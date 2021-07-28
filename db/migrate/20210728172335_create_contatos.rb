class CreateContatos < ActiveRecord::Migration[6.1]
  def change
    create_table :contatos do |t|
      t.integer :tipo, null: false, default: 0
      t.string :valor, null: false
      t.integer :pessoa_id, null: false

      t.timestamps
    end
    add_foreign_key :contatos, :pessoas
  end
end
