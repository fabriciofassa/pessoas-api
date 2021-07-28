Rails.application.routes.draw do
  scope defaults: {format: :json} do
    controller :pessoas do 
      get '/pessoas',      action: :index
      get '/pessoas/nova',  action: :new
      get '/pessoas/:id',  action: :show
      post '/pessoas',     action: :create
      patch '/pessoas/:id', action: :update
      delete '/pessoas/:id', action: :destroy
    end
  end
end
