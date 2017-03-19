OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '48599384682-0te8k73ocu4cktqjbh3pn79tukm2q093.apps.googleusercontent.com', '69ozH1vgRHFxZ6kgPCQmj6ej', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
