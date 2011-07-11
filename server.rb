require 'sinatra'
require 'haml'
require 'RMagick'
include Magick # evite de réecrire le namespace: Magick:ImageList ...

def putNameOnImage name
  carte = ImageList.new('public/img/carte.jpg')
  text = Draw.new
  #text.font_family = 'helvetica'
  text.pointsize = 18
  text.annotate( carte, 0,0,20,30, name) {
    self.fill = '#0848ac'
    }
  carte.write('public/img/cartename.jpg')
end

get '/' do
  redirect 'index.html'
end

get '/cartes/:name' do
  @name = params[:name]
  putNameOnImage @name
  haml :cartes
end

post '/cartes' do
  #params[:name]
  @name = params[:name]
  putNameOnImage @name
  haml :cartes
end
