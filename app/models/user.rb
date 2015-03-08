class User < ActiveRecord::Base
  serialize :spotify_hash
end
