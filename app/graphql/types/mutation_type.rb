module Types
  class MutationType < Types::BaseObject
  	field :create_post, mutation: Mutations::CreatePost
  	field :create_user, mutation: Mutations::CreateUser
  	field :login, mutation: Mutations::Login
  	field :create_comment, mutation: Mutations::CreateComment
  end
end
