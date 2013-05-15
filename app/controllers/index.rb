get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.find_or_create_by_long(params[:long_url])

  erb :_link, :layout => false
end


get '/:short_url' do |short|
  @url = Url.find_by_short(short)
  @url.counter += 1
  @url.save

  redirect "http://#{@url.long}"
end