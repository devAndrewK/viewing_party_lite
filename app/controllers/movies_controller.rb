class MoviesController < ApplicationController
  def top_rated
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response1 = conn.get("/3/movie/top_rated?page=1&")
    response2 = conn.get("/3/movie/top_rated?page=2&")
    
    data1 = JSON.parse(response1.body, symbolize_names: true)
    data2 = JSON.parse(response2.body, symbolize_names: true)
    
    movies1 = data1[:results]
    movies2 = data2[:results]
    @movies = movies1 + movies2
    render "movies/index"

  end
  def discover 
    @user = User.find(params[:user_id])
  end

  def index
  end

end