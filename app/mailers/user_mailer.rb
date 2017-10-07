class UserMailer < ApplicationMailer
  default from: 'justinvholt@gmail.com'
  
  def confirm_or_no(admin)
    @admin = admin

    mail to: 'justinvholt@gmail.com', subject: 'SplurtyAbroad Quote Submission'
  end

end
