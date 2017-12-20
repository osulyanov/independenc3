module Api
  module V1
    class V1Controller < Api::ApiController
      include Knock::Authenticable
      before_action :authenticate_user
    end
  end
end
