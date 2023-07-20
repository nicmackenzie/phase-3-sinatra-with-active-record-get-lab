class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json
  end

  get '/baked_goods/by_price' do
    sorted = BakedGood.all.order(price: :desc)
    sorted.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.all.order(price: :desc).limit(1)
    most_expensive.to_json
  end

end
