require 'net/http'
require 'uri'
require 'json'

class User < ApplicationRecord
  validates :cclogin,
            presence: true,
            length: { minimum: 1, maximum: 12},
            format: { with: /\A[A-Za-z]+\z/ },
            uniqueness: true
  before_create :get_user_realname

  def get_user_realname
    # This method is never entered if the cclogin is repeated, so, no worries
    # about wasted GET requests
    uri = URI.parse("https://search.pclub.in/api/student?username=#{cclogin}")
    response = Net::HTTP.get_response(uri)
    self.name = JSON.parse(response.body)["n"]
  end
end
