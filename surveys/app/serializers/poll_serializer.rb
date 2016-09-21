class PollSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :options
end
