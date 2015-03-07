namespace :sandbox do

  task :spotify => :environment do
    require Rails.root + "lib/spotify"
    SpotifySandbox.new
  end
end