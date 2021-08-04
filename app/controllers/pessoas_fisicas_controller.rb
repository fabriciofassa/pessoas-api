class PessoasFisicasController < ApplicationController


   def index
       @pessoas_fisicas = Pessoa.where(id_tp_entidade: 2).page(params[:page]).order(:id_pessoa)    
   end

end    