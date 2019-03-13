
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
    article = Article.create(title: params[:title], content: params[:content])
    article.save
    @articles = Article.all
    erb :index
  end
end
