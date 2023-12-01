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
      expect(cat.age).to eq 6
      expect(cat.enjoys).to eq 'Blasting off on adventures with friends.'
      expect(cat.image).to eq 'https://pm1.aminoapps.com/6191/af866493a1fd8888f69af71119570b473f13b747_hq.jpg '


    end
  end

  describe "Patch/ update" do 
    it "updates a cat" do 
      cat_params = {
        cat: { 
          name: 'Meowth', 
          age: 6,
          enjoys: 'Blasting off on adventures with friends.',
          image: 'https://pm1.aminoapps.com/6191/af866493a1fd8888f69af71119570b473f13b747_hq.jpg '
        }
      }

      post '/cats', params: cat_params

      cat = Cat.first 

      updated_cat_params = {
        cat: { 
          name: 'Meowth', 
          age: 6,
          enjoys: 'Blasting off on adventures with friends, and chasing electric mice!.',
          image: 'https://pm1.aminoapps.com/6191/af866493a1fd8888f69af71119570b473f13b747_hq.jpg '
        }
      }
      patch "/cats/#{cat.id}", params: updated_cat_params

      expect(response).to have_http_status(200)
      updated_cat = Cat.find(cat.id)
      expect(updated_cat.age).to eq 6
      expect(updated_cat.enjoys).to eq 'Blasting off on adventures with friends, and chasing electric mice!.'
      expect(updated_cat.image).to eq 'https://pm1.aminoapps.com/6191/af866493a1fd8888f69af71119570b473f13b747_hq.jpg '
    end
  end

  describe "DELETE /destroy" do 
    it "deletes a cat" do 
      cat_params = {
        cat:{
        name: 'Tom',
        age: 5,
        enjoys: 'Chasing Jerry the mouse!',
        image: 'https://external-preview.redd.it/V9nefe8HijMMXoyyPx0253n5JUzs7KOmdCYpnkkSb48.jpg?auto=webp&s=d03bd19da6a28a1c054bb4bb6e81badf67bd4512'
    }
  }
      post '/cats', params: cat_params 

      cat = Cat.first

      delete "/cats/#{cat.id}"

      expect(response).to have_http_status(200)
      cats = Cat.all 
      expect(cats).to be_empty
    end
  end

end

