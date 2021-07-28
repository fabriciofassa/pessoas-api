json.call(@pessoa, :id,:nome, :tipo_entidade)
json.contatos @pessoa.contatos do |contato|
    json.id contato.id
    json.tipo contato.tipo
    json.valor contato.valor
end