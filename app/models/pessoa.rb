class Pessoa < ApplicationRecord
    enum tipo_entidade: {fisica: 0, juridica:1}
    validates :nome, presence: true
    validates :tipo_entidade, presence: true
end
