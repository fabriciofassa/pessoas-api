class Historico < ApplicationRecord
    self.table_name = 'sis_pessoa_historico'
    self.primary_key = 'id_pessoa_historico'
end    