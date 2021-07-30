class Pessoa < ApplicationRecord
   # Fabricio
    enum tipo_entidade: {fisica: 0,juridica: 1}, _prefix: true

    validates :nome, presence: true
    validates :tipo_entidade, presence: true

    #  Pertence a, tem um, tem vários
    has_many :contatos, dependent: :restrict_with_error
    accepts_nested_attributes_for :contatos, allow_destroy: true

    # Método de classe
       # Pessoa.tipo_entidade_fisica
       # Pessoa.tipo_entidade_jurica

    # Método de Instancia
       # tipo_entidade_fisica? e tipo_entidade_fisica!
       # tipo_entidade_juridica ? e tipo_entidade_juridica!
       
       
end
