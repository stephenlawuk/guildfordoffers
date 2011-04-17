class Mailer < ActionMailer::Base
   default :from => "guildfordstudentoffers@gmail.com"

   def registration_confirmation(email)
     mail(:to => email.email, :subject => "Registered")
   end
end
