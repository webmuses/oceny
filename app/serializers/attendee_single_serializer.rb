class AttendeeSingleSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :name, :email, :age, :place, :experience, :level, :os, :reason,
    :prev_id, :next_id

  def prev_id
    object.prev.try(:id)
  end

  def next_id
    object.next.try(:id)
  end
end
