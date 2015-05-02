class SubmissionSingleSerializer < SubmissionEachSerializer
  self.root = false

  attributes :about, :experience, :english, :os, :been_before, :reason, :extra,
    :position, :prev_id, :next_id, :status

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

  def status
    return "odrzucone" if object.rejected?

    return "ocenione (#{rates_count})" if rates_count >= Submission::MIN_RATES_COUNT

    "oczekuje (liczba ocen: #{rates_count})"
  end
end
