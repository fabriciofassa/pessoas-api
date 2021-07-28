class Contato < ApplicationRecord
    enum tipo: [:telefone, :celular, :email]
    belongs_to :pessoa
end
