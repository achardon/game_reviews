class ReviewSerializer < ActiveModel::Serializer
  attributes :review, :game, :user

  def game
    object.game.title
  end

  def user
    object.user.username
  end

end
