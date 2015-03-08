 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "74a5a213821741e1ae60ba4f2f0fac61", "2200ab1ce25c42d6b285a171b1aec60a", scope: 'playlist-modify-public user-library-read playlist-modify-private user-read-private user-library-read'
end