class UserSerializer
  include JSONAPI::Serializer
  attributes :user_name, :email_address, :emergency_contact_name, :emergency_number, :auth
end
