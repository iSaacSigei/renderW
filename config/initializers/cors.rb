Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://wo-mall-git-master-isaacsigeis-projects.vercel.app/','https://www.womall.africa/','https://wo-mall-a8gd2hz7n-isaacsigeis-projects.vercel.app/'
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end
  end
  