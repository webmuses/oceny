class SubmissionSingleSerializer < SubmissionEachSerializer
  self.root = false

  attributes :id, :fullname, :email, :age, :about, :experience, :english, :os,
    :been_before, :reason, :extra, :position, :prev_id, :next_id, :average_rate

  has_many :rates
  has_many :comments

  def id
    "#{object.id}"
  end

  def position
    decorated.position + 1
  end

  def prev_id
    decorated.prev ? "#{decorated.prev.id}" : nil
  end

  def next_id
    decorated.next ? "#{decorated.next.id}" : nil
  end
end
