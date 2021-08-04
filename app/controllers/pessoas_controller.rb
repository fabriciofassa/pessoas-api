class PessoasController < ApplicationController
    
    # GET | POST | PATCH | DELETE
    # CRUD   => CREATE, READ, UPDATE, DELETE, 
    # CRUD++ => LIST, NEW, EDIT

    # GET: Listar Todos os Registros
    def index 
        #@pessoas = Pessoa.all.limit(25).order(:id_pessoa)
        #@pessoas = Pessoa.all.page(params[:page])

        @pessoas = FiltrarPessoas.filtrar(params)
    end    

    # GET: Exibir detalhes de UM ÚNICO registro
    def show
        begin
           @pessoa = Pessoa.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'Registros não encontrado'}, status:404
        end
    end

    # GET: Trazer valores padrão para criar um recurso
    def new
        # pessoa = Pessoa(name: '', tp_entidade: '')
        # tp_entidade = ['pj', 'pf']
    end
   
    # POST: Criar um novo recurso
    def create
        @pessoa = Pessoa.new(pessoa_params)
        # Passar parametros
        #pessoa.attributes = pessoa_params 
        if @pessoa.save
            # Responder que salvou
            #render json: { id: pessoa.id }, status: 201
            render :show, status: 201
        else 
           # render json: { error: "Deu erro" }, status: 422   
           render json: { error: pessoa.errors.full_messages }, status: 422   
        end     
    end  

    # GET: Trazer o registro já preenchido do banco de dados
    def edit
        # pessoa = Pessoa(id: 1, name: 'João', tp_entidade: 'PF')
        # tp_entidade = ['pj', 'pf']
    end

    # PATCH: Atualizar o registro no banco
    def update
        @pessoa = Pessoa.find(params[:id])
        # Passar parametros
        @pessoa.attributes = pessoa_params
        if @pessoa.save
            # Responder que salvou
            #render json: { id: pessoa.id }, status: 201
            render :show
        else 
           # render json: { error: "Deu erro" }, status: 422   
           render json: { error: pessoa.errors.full_messages }, status: 404  
        end  
    end
    

    # DELETE: Apagar o registro
    def destroy
        pessoa = Pessoa.find(params[:id])
        if pessoa.destroy
            # Responder que deletou
            render json: { id: pessoa.id }, status: 201
        else 
           # render json: { error: "Registro Excluído" }, status: 422   
           render json: { error: pessoa.errors.full_messages }, status: 422 
        end          
    end

    private

    def pessoa_params
       params.permit(:nome, :tipo_entidade, contatos_attributes: [:id, :tipo, :valor, :_destroy])
    end     

end    