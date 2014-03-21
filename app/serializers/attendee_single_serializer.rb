class AttendeeSingleSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :name, :email, :age, :place, :experience, :level, :os, :reason,
    :prev_id, :next_id, :average_rate

  has_many :rates

  def prev_id
    object.prev.try(:id)
  end

  def next_id
    object.next.try(:id)
  end

  def average_rate
    object.rates.map(&:value).reduce(:+)
  end
end
