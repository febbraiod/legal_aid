class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :created_at
  has_one :user
end
