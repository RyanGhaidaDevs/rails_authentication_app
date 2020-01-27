if Rails.env === "development"
  Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "https://bugloggerapp.herokuapp.com/"
else 
  Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end 