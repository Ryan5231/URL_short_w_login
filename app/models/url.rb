class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :shorten_url
  validates :short, :uniqueness => true
  validates :long, {:uniqueness => true, :presence => true}
  validates :long, :format => {:with => /^www\..*/, :message => "URL must start with 'www'" }

  def shorten_url
    random    = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
    short_url = random.sample(5).join

    self.short = short_url
  end
end