class OwnerController < Sinatra::Base

    set :views, "app/views/owner"
    set :method_override, true

    get '/owners' do
        @owners = Owner.all
        erb :index
    end

    get '/owners/new' do
        erb :new
    end

    post '/owners' do
        name = params[:name]
        owner = Owner.create(name: name)
        redirect '/owners/#{owner.id}' 
    end
    
    get '/owners/:id' do
        id = params[:id]
        @owner = Owner.find(id)
        erb :show
    end



end 