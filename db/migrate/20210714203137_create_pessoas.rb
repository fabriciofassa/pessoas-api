class CreatePessoas < ActiveRecord::Migration[6.1]
  def change
    create_table :pessoas do |t|
      t.string :nome, null: false
      t.integer :tipo_entidade, null: false, default: 0

      t.timestamps
    end
  end
end
