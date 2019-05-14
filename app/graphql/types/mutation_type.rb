module Types
  class MutationType < Types::BaseObject
  	field :create_post, mutation: Mutations::Post::CreatePost
  	field :create_user, mutation: Mutations::User::CreateUser
  	field :login, mutation: Mutations::User::Login
  end
end
