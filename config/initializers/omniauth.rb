OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '368305440792-d2qe1foo5qojlb3pf68q6f2g7t874094.apps.googleusercontent.com', 'YHcq8eYFXMZAA0QfRRyJcKtR', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
