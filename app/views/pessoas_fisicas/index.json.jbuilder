#json.array! @pessoas, :id_pessoa, :nome_razao, :id_tp_entidade
json.current_page @pessoas_fisicas.current_page
json.total_pages @pessoas_fisicas.total_pages
json.pessoas @pessoas_fisicas do |pessoa|
   json.id_pessoa pessoa.id_pessoa
   json.nome_razao pessoa.nome_razao
   json.documento pessoa.documento
   json.id_tp_entidade pessoa.id_tp_entidade
end       

