class Rolodex<Contact
  
  def initialize (contacts=nil)
    @id = 1000
    @contacts=[]
  end

  attr_accessor(:contacts)

  def assign_id(i_contact)
    i_contact.id=@id
    @contacts<<(i_contact)
    @id += 1
  end

end