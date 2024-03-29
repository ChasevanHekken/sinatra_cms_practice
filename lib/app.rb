require 'sinatra'
require './lib/app/models/page'

class CMS < Sinatra::Base

  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/pages/:slug' do |slug|
    page = Page.find_by_slug(slug)
    erb :page, :locals => {:page => page}
  end

  get '/pages/?' do
    pages = Page.all
    erb :index, locals: { pages: pages }
  end

  get '/edit/:slug/?' do |slug|
    page = Page.find_by_slug(slug)
    erb :edit, :locals => {:page => page}
  end

  post '/edit/:slug/submit/?' do |slug|
    Page.update(slug, params[:content])
    redirect "/pages/#{slug}"
  end
end
