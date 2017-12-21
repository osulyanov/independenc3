module Api
  class ApiController < InheritedResources::Base
    include Knock::Authenticable
    respond_to :json
    protect_from_forgery with: :null_session
    before_action :authenticate_user
  end
end
