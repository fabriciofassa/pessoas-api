class FiltrarPessoas

    def self.filtrar(params)
        #@pessoas = Pessoa.all.limit(25).order(:id_pessoa)
        #@pessoas = Pessoa.all.page(params[:page])

        # http://localhost:3010/pessoas?nome=joao
        
        @pessoas = Pessoa.all

        #Pesquisas por nome
        @pessoas = por_nome(params[:nome])  if params[:nome]
        
        #Pesquisas por documento
        @pessoas = por_documento(params[:documento])  if params[:documento]        

        #Pesquisas por tipo de id_tp_entidade
        @pessoas = por_tipo_entidade(params[:id_tp_entidade])  if params[:id_tp_entidade]   
        #@pessoas = @pessoas.where("id_tp_entidade = ? ", "#{params[:id_tp_entidade]}")  if params[:id_tp_entidade]        

        #Paginando o resultado
        @pessoas = @pessoas.page(params[:page]).order(:id_pessoa)       
    end

    def self.por_nome(nome)
       @pessoas.where("nome_razao ILIKE ? ", "#{nome}%")
    end    

    def self.por_documento(documento)
       @pessoas.where("documento ILIKE ? ", "#{documento}%")
    end        

    def self.por_tipo_entidade(id_tp_entidade)
       @pessoas.where("id_tp_entidade = ? ", id_tp_entidade)
    end    
end    