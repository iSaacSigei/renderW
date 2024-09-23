Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.womall.africa', 'http://localhost:4000/', 'https://mysite-jr5y.onrender.com', 'https://www.eigoll.co.ke'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
