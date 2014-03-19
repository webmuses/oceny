class AttendeeEachSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :place, :experience, :level, :os, :reason
end
