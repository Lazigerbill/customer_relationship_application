
puts "\e[H\e[2J"

class CRM
  def initialize
    @user=Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def main_menu

    user_selected=0
    until user_selected>=1 && user_selected<=6
      print_main_menu
      user_selected = gets.to_i
    end
  call_option(user_selected)
  end


  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_all if user_selected == 4
    display_attr if user_selected == 5
    exit if user_selected == 6
  end

  def add_new_contact
    input="n"
    until input=="y"
      print "Enter First Name: "
      first_name = gets.chomp.capitalize
      print "Enter Last Name: "
      last_name = gets.chomp.capitalize
      print "Enter Email Address: "
      email = gets.chomp.downcase
      print "Enter a Note: "
      note = gets.chomp
      id=nil
      @contact = Contact.new(id, first_name, last_name, email, note)
      #puts "Contact ID: #{@contact.id}"
      puts "Fist name: #{@contact.first_name}"
      puts "Last name: #{@contact.last_name}"
      puts "email: #{@contact.email}"
      puts "Note: #{@contact.note}"
      puts "Confirm the above entry?(y/n)"
      input=gets.chomp.downcase
    end
    @user.assign_id(@contact)
    puts "New contact #{@user.contacts[-1].first_name} #{@user.contacts[-1].last_name} is now added to ID: #{@user.contacts[-1].id}"
    main_menu
  end
  def modify_existing_contact
      puts "\e[H\e[2J"
      @user.contacts.each do |key|
        puts "Contact ID: #{key.id} #{key.first_name} #{key.last_name}"
      end
      id_list=[]
      @user.contacts.each do |key|
       id_list<<key.id
      end
      id=nil
      until id_list.include?(id)
       puts "Input the id you wish to modify:"
       id=gets.chomp.to_i
      end
      index=id_list.index(id)
      option=0
      until option >=1 && option <=5
      puts "What attribute would you like to modify for ID: #{id}?"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] email"
      puts "[4] note"
      puts "[5] exit"
      puts "Enter a number: "
      option=gets.chomp.to_i
      end
      case option
      when 1
        puts"Enter new First name"
        input=gets.chomp.capitalize
        @user.contacts[index].first_name.replace(input)
      when 2
        puts"Enter new Last name"
        input=gets.chomp.capitalize
        @user.contacts[index].last_name.replace(input)
      when 3
        puts"Enter new email"
        input=gets.chomp.downcase
        @user.contacts[index].email.replace(input)
      when 4 
        puts"Enter new note"
        input=gets.chomp
        @user.contacts[index].note.replace(input)
      else
        main_menu
      end
      modify_existing_contact
  end
  def display_all
    puts "\e[H\e[2J"
    @user.contacts.each do |key|
        puts "Contact ID: #{key.id} #{key.first_name} #{key.last_name}"

        end
      main_menu
  end
  def delete_contact
      puts "\e[H\e[2J"
      @user.contacts.each do |key|
          puts "Contact ID: #{key.id} #{key.first_name} #{key.last_name}"
        end
      id_list=[]
      @user.contacts.each do |key|
        id_list<<key.id
      end
      id=nil
      until id_list.include?(id)
        puts "Input the id you want to delete:"
        id=gets.chomp.to_i
      end
      @user.contacts.delete_if do |key|
        key.id==id
      end
      puts"ID: #{id} is now DELETED!"
      main_menu
    end
  def display_attr
    option=0
    until option >=1 && option <=4
      puts "What attribute would you like to display for all contacts?"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] email"
      puts "[4] note"
      puts "Enter a number: "
      option=gets.chomp.to_i
      end 
    case option 
    when 1
      puts "Display \"First name\" of all contacts:"
      @user.contacts.each do |key|
        puts "ID: #{key.id} -> #{key.first_name}"
      end
    when 2
      puts "Display \"Last name\" of all contacts:"
      @user.contacts.each do |key|
        puts "ID: #{key.id} -> #{key.last_name}"
      end
    when 3
      puts "Display \"email\" of all contacts:"
      @user.contacts.each do |key|
        puts "ID: #{key.id} -> #{key.email}"
      end
    when 4
      puts "Display \"note\" of all contacts:"
      @user.contacts.each do |key|
        puts "ID: #{key.id} -> #{key.note}"
      end
    end
    main_menu
    

    end



end



















