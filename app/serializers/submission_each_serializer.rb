class SubmissionEachSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :age, :email

  def id
    "#{object.id}"
  end
end
