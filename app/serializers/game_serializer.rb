class GameSerializer < ActiveModel::Serializer
  attributes :title, :genre, :description, :price

  has_many :reviews
  has_many :users

  def price
    "$#{'%.2f' % object.price}"
  end

end
