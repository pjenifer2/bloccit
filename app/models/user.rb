class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_save :format_name

   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }


   has_secure_password


   #let's discuss before save more ... i think this is simply
   #downcasing the email to allow for uniqueness check before doing check

   #for email regex ... is this simply setting a variable with characters we wouldn't see
   #in an e-mail


   #let's discuss bcrypt further

   #this was my attempt
   #def username_lowercase
     #this code works in IRB (except I didn't use self.name)

     #split self.name
    # arrayofname = name
    # newname = arrayofname.split.map(&:capitalize)
    # finalname = newname.join(" ")
    #
    # self.name = finalname

   #end

   def format_name
     if name
       name_array = []
       name.split.each do |name|
         name_array << name.capitalize
       end

       self.name = name_array.join(" ")

     end
   end






end
