class PessoasController < ApplicationController
    # Fabricio
    def index
      @pessoas =  Pessoa.all
    end

    def show
        @pessoa =  Pessoa.find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'Registro não encontrado'}, status: 404
    end

    def create
      @pessoa = Pessoa.new(pessoa_params)
      if pessoa.save
        render :show, status: 201
      else
        render json: {error: pessoa.errors.full_messages}, status: 422   
      end
    end

    def update
      pessoa = Pessoa.find(params[:id])
      pessoa.attributes = pessoa_params
      if pessoa.save
        render json: {id: pessoa.id}, status: 200
      else
        render json: {error: pessoa.errors.full_messages}, status: 422   
      end
    end

    def destroy
      pessoa = Pessoa.find(params[:id])
      if pessoa.destroy
        render json: {message: "Registro Excluido"}, status: 200
      else
        render json: {error: pessoa.errors.full_messages}, status: 422 
      end
    end

    private
    def pessoa_params
        params.permit(:nome, :tipo_entidade, contatos_attributes: [:id, :tipo, :valor, :_destroy])
    end

end 