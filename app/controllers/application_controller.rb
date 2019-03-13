
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles/new' do

    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show

  end

  post '/articles' do
    article = Article.new
    article.name = params[:name]
    article.content = params[:content]
    article.save
    erb :index
  end
end
