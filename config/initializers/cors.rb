# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  methods = %i[get post]

  allow do
    if Rails.env.production?
      origins 'example.com' # TODO: あとで変更する
    else
      origins Regexp.new('localhost:8080')
    end
    resource '*', headers: :any, methods: methods, credentials: true
  end
end
