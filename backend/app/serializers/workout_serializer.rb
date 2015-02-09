class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  embed :ids

  has_many :exercises
end
