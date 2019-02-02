class CommentType < Types::BaseObject
  field :id, ID, null: true
  field :post, PostType, null: false
  field :body, String, null: false
  field :author, UserType, null: false
  field :comments, [CommentType], null: true
end