module V1
  class InterestSerializer<ActiveModel::Serializer
    attributes :description
    has_one :user
  end
end
