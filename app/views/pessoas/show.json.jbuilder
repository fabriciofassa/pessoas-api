json.call(@pessoa, :id_pessoa, :nome_razao, :id_tp_entidade, :email, :email_alternativo)
json.historicos @pessoa.historicos do |historico|
   json.nome historico.nome
   json.dt_cadastro historico.dt_cadastro
   json.dt_alteracao historico.dt_alteracao
end   