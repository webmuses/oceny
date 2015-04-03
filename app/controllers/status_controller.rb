class StatusController < ActionController::Base
  try(:newrelic_ignore)

  def check
    head(:ok)
  end
end
