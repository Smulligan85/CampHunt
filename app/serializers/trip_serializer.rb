class TripSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_many :supplies
end
