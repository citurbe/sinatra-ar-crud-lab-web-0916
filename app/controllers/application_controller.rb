require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'index.html'
  end

  get '/posts/new' do
    erb :'new.html'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show.html'
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content]).save
    redirect '/posts'
  end

  get '/posts/:id/update' do
    @post = Post.find(params[:id])
    erb :'update.html'
  end

  delete '/posts/:id/delete' do
    @name = Post.find(params[:id]).name
    Post.destroy(params[:id])
    erb :'deleted.html'
  end

  patch '/posts/:id' do
    
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    @post.save
    redirect '/posts'
  end
end
