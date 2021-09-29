module RequestHelpers
  def basic_auth(obj, password = 'password')
    email = obj.try(:email) || obj

    encoded_string = ::Base64.strict_encode64("#{email}:#{password}")

    "Basic #{encoded_string}"
  end
end
