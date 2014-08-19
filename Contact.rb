class Contact	
  # def initialize(first_name=nil, last_name=nil, email=nil, note=nil)
    # @first_name = first_name
    # @last_name = last_name
    # @email = email
    # @note = note
  # end

attr_accessor(:first_name, :last_name, :email, :note, :temp)

	def load (first_name, last_name, email, note)
		@temp={}
		@temp={
			:first_name=>first_name,
			:last_name=>last_name,
			:email=>email,
			:note=>note
		}
		# puts @temp
	end
end