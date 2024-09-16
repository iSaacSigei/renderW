Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.womall.africa', 'https://mysite-jr5y.onrender.com', 'https://www.eigoll.co.ke',# Allow both domains
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
