require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # intialize test data
  let!(:users) {create_list(:user, 10)}
  let(:user_id) {users.first.id}

  # Test suite for GET /users
  describe 'GET /v1/users' do
    # make HTTP get request before each example
    before { get '/v1/users'}

    it 'returns users' do
      expect(json["users"]).not_to be_empty
      expect(json["users"].size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suit for GET /users/:id
  describe 'GET /v1/users/:id' do
    before { get "/v1/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json["user"]).not_to be_empty
        expect(json["user"]["id"]).to eq(user_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) {100}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"error\":\"translation missing: en.User could not be found\"}")
      end
    end
  end

  #  Test suite for POST /v1/users
  describe 'POST /v1/users' do
    let(:valid_attributes) { {user: {username: "elm", email: "elm@example.com" , password: "password", password_confirmation: "password"}} }

    context 'when request is valid'do
    before { post '/v1/users', params: valid_attributes }

      it 'creates a user' do
        expect(json["user"]["username"]).to eq('elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the requests are invalid' do
      before {post '/v1/users', params: {user: {username: "blah"}}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match ("{\"error\":\"translation missing: en.user_create_error\"}")
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attributes) { {user: {username: "elmer", email: "elmer@example.com" , password: "pard", password_confirmation: "pard"}} }
    context 'when the record exists' do
      before { put "/v1/users/#{user_id}", params: valid_attributes}

      it 'updated the users record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /v1/users/:id' do
    before { delete "/v1/users/#{user_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
