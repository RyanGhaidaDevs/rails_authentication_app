#gives you ability to whitlist certain domains.
#give rules for how your going to be able to communicate.

Rails.application.config.middleware.insert_before 0, Rack::Cors do 
  allow do 
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true 
  end 
  #url for app below
  allow do 
    origins "https://bugloggerapp.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true 
  end 
end 




