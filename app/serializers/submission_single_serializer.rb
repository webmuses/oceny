class SubmissionSingleSerializer < SubmissionEachSerializer
  self.root = false

  attributes :about, :experience, :english, :os, :been_before, :reason, :extra,
             :displayed_position, :status, :codecademy_username, :codecademy_status

  has_many :rates
  has_many :comments

  def id
    object.id.to_s
  end

  def position
    list.index { |submission| submission.id == object.id }
  end

  def displayed_position
    position ||= 0
    position + 1
  end

  def status
    return "odrzucone" if object.rejected?

    return "ocenione (#{rates_count})" if rates_count >= Submission::MIN_RATES_COUNT

    "oczekuje (liczba ocen: #{rates_count})"
  end

  private

  def list
    @list ||= object.class.all.order(:id.asc).to_a
  end
end
