class UserType < Types::BaseObject
  field :id, ID, null: true
  field :name, String, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :password, String, null: false
  field :posts, [PostType], null: true
  field :createdAt, Time, null: false
  field :updatedAt, Time, null: true
  field :deletedAt, Time, null: true
end