class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  has_many :networks

  def full_name
    "#{self.first_name} #{ self.last_name}"
  end 
  
  def list_roles
    #Output character_name - show_name
    character_name = self.characters.collect { |character| character.name}
    show_name = self.shows.collect { |show| show.name}
    role_info = character_name.push(show_name.first).join(" - ")
    role = []
    role << role_info
    role
  end 

end