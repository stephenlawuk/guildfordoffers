module ApplicationHelper
  # Custom Date Formatting DD/MM/YYYY at H:M am/pm
  def display_date(input_date)
    return input_date.strftime("%a, %d %B %Y at %I:%M%p")
  end

end
