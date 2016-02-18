get '/?' do
  # Look in app/views/index.erb
  redirect "/questions"
end

get '/public/imgs/:id' do
  send_file File.join(settings.public_folder, 'imgs', params[:id])
end
