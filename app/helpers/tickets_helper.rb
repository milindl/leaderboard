module TicketsHelper
  def status_word(status_bool)
    if status_bool
      "Approved"
    else
      "Pending"
    end
  end

  def desc_link_text(ut)
    if ut.desc.nil? || ut.desc.length < 1
      return "[Link]"
    else
      return ut.desc
    end
  end
end
