module TicketsHelper
  # Defines all Ticket types to select from
  @@ticket_types = ['Open Source', 'Competitive', 'ML', 'PClub Activities', 'Other']

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

  def get_ticket_types()
    options = []
    @@ticket_types.each do |ticket_type|
      options.push([ticket_type, ticket_type])
    end
    return options
  end
end
