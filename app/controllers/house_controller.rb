class HouseController < Sinatra::Base

    set :views, "app/views/house"
    set :method_override, true

    get "/houses" do 
        @houses = House.all
        erb :index
    end 

    get "/houses/new" do
        erb :new 
    end

    post "/houses" do
        style = params[:style]
        color = params[:color]
        house = House.create(style: style, color: color, owner_id: 8)
        redirect "/houses/#{house.id}"
    end

    get "/houses/:id" do
        id = params[:id] 
        @house = House.find(id)
        erb :show
    end 

    get "/houses/:id/edit" do
        id = params[:id]
        @house = House.find(id)
        erb :edit
    end

    patch "/houses/:id" do 
        id = params[:id]
        house = House.find(id)
        style = params[:style]
        color = params[:color]
        house.update(style: style, color: color)
        redirect "/houses/#{house.id}"
    end

    delete "/houses/:id" do 
        @house = House.find(params[:id])
        @house.destroy
        redirect "/houses"
    end     

end 