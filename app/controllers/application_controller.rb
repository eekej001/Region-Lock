class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



def add_cors_headers
  origin = request.headers["Origin"]
  unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
    origin = "https://projecthentai.com"
    origin2 = "https://www.projecthentai.com"
  end
  headers['Access-Control-Allow-Origin'] = origin
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
  allow_headers = request.headers["Access-Control-Request-Headers"]
  if allow_headers.nil?
    #shouldn't happen, but better be safe
    allow_headers = 'Origin, Authorization, Accept, Content-Type'
  end
  headers['Access-Control-Allow-Headers'] = allow_headers
  headers['Access-Control-Allow-Credentials'] = 'true'
  headers['Access-Control-Max-Age'] = '1728000'
end

before_filter :add_cors_headers


end
