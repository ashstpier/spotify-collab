namespace :import do

  task :spotify => :environment do
    require Rails.root + "lib/spotify"
    Spotify.new
  end
end