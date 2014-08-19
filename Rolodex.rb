class Rolodex
  def initialize (contacts=0,temp=0)
    @temp = {}
    @id = 1000
    @contacts={}
  end

  attr_accessor(:contacts, :id)

  # def contacts
  #   @contacts
  # end

  def push(temp)
    @contacts.store(@id,temp)
    # puts @temp
    # @contacts.merge!(@temp)
    @id += 1
    # puts @id
    # puts @contacts
  end
end