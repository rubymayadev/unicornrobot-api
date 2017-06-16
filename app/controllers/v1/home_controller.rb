module V1
  class HomeController < ApplicationController
    def index
      puts session
      render json: {'logged_in' => true}
    end
  end
end
