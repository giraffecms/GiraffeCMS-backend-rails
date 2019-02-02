class PostType < GraphQL::Schema::Object
  field :id, ID, null: true
  field :title, String, null: false
  field :body, String, null: false
  field :author, UserType, null: false
  field :comments, [CommentType], null: true
  field :createdAt, Time, null: false
  field :updatedAt, Time, null: true
  field :deletedAt, Time, null: true
end