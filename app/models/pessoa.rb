class Pessoa < ApplicationRecord
    enum tipo_entidade: {fisica: 0, juridica:1}

    validates :nome, presence: true
    validates :tipo_entidade, presence: true

    has_many :contatos, dependent: :restrict_with_error
    accepts_nested_attributes_for :contatos, allow_destroy: true
end
