class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id
  has_many :supplies
end
