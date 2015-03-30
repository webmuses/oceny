class SubmissionEachSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :email

  def id
    "#{object.id}"
  end
end
