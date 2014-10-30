module ApplicationHelper

  def fix_url(url)
   url.starts_with?("http://")  ? url : "http://#{url}"
  end

  def pretty_time_string(date_time)
    date_time.localtime.strftime("%B %d, %Y at %I:%M%P %Z")
  end

  def display_datetime(dt)
   #Month/Day/Year Hour:Minute(am/pm) - timezone
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end

  def display_datetime_with_zone(dt)
    if logged_in? && !current_user.time_zone.blank?
      dt = dt.in_time_zone(current.user.time.zone)
    end

  end


end
