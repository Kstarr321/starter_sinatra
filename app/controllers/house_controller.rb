class HouseController < Sinatra::Base

    set :views, "app/views/house"
    set :method_override, true

    get "/houses" do 
        @houses = House.all
        erb :index
    end 

    get "/houses/:id" do
        id = params[:id] 
        @house = House.find(id)

        erb :show
    end 

    delete "/houses/:id" do 
        @house = House.find(params[:id])
        @house.destroy
        redirect "/houses"
    end     

end 