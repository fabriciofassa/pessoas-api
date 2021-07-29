json.id @pessoa.id
json.nome @pessoa.nome
json.tipo_entidade @pessoa.tipo_entidade
json.contatos @pessoa.contatos do |contato|
   json.id contato.id
   json.tipo contato.tipo
   json.valor contato.valor
end   