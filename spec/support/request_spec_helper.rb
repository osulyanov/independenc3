module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def jwt_header
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'Authorization' => "Bearer #{token}" }
  end
end
