module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :username, :email
  end
end
