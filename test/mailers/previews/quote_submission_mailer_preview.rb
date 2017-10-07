# Preview all emails at http://localhost:3000/rails/mailers/quote_submission_mailer
class QuoteSubmissionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/quote_submission_mailer/confirm_or_no
  def confirm_or_no
    QuoteSubmissionMailer.confirm_or_no
  end

end
