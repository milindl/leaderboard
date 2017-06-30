module TicketsHelper
  def status_word(status)
    status.to_s.titleize
  end

  def desc_link_text(ut)
    return ut.desc unless ut.desc.nil? || ut.desc.length < 1
    "[Link]"
  end

  def ticket_types
    # Defines all Ticket types to select from
    ticket_types = ["Open Source", "Competitive", "ML", "PClub Activities", "Other"]
    options = []
    ticket_types.each do |ticket_type|
      options.push([ticket_type, ticket_type])
    end
    options
  end
end
