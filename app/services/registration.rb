class Registration
  def self.open?
    now = Time.now
    return true if now >= date(:from) and now <= date(:to)
    false
  end

  private

  def self.date(key)
    DateTime.parse(A9n.registration[key])
  end
end
