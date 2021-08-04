Rails.application.routes.draw do
  scope defaults: { format: :json } do

     root to: "pessoas#index"

     controller :pessoas do
       get '/pessoas',      action: :index
       get '/pessoas/:id',  action: :show
       post '/pessoas',     action: :create
       patch '/pessoas/:id', action: :update
       delete '/pessoas/:id', action: :destroy
     end

     controller :pessoas_fisicas do
       get '/pessoas-fisicas', action: :index
    end     

  end
end
