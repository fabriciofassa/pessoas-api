json.tipo_entidades do
    json.array! Pessoa.tipo_entidades do |chave, valor|
        json.id chave
        json.label "FORMATADO #{chave}" #I18n.t 
    end
end        