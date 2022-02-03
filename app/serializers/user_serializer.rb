class UserSerializer < ActiveModel::Serializer
  attributes :username

  has_many :games
  has_many :reviews
end
