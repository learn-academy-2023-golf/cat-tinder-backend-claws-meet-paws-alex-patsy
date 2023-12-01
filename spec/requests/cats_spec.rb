require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Tom',
        age: 5,
        enjoys: 'Chasing Jerry the mouse!',
        image: 'https://external-preview.redd.it/V9nefe8HijMMXoyyPx0253n5JUzs7KOmdCYpnkkSb48.jpg?auto=webp&s=d03bd19da6a28a1c054bb4bb6e81badf67bd4512'
      )
      get '/cats' 
    
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1 

    end
  end
  describe "POST /create" do 
    it "creates a cat" do 
      cat_params = {
        cat: { 
          name: 'Meowth', 
          age: 6,
          enjoys: 'Blasting off on adventures with friends.',
          image: 'https://pm1.aminoapps.com/6191/af866493a1fd8888f69af71119570b473f13b747_hq.jpg '
        }
      }

      post '/cats', params: cat_params 

      expect(response).to have_http_status(200)

      cat = Cat.first

      expect(cat.name).to eq 'Meowth'
    end
  end

end

