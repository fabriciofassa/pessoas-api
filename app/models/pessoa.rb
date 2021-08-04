class Pessoa < ApplicationRecord
   self.table_name = 'sis_pessoa'
   self.primary_key = 'id_pessoa' 

   has_many :historicos, foreign_key: :id_pessoa
   
   # Pessoa.fisica => Pessoa
   default_scope { where(id_tp_entidade: [1,2]) }
   scope :fisica, -> { where(id_tp_entidade: 2) }
   scope :nome_razao, -> { where(id_tp_entidade: 1) }
end
