require 'test_helper'

class QuoteSubmissionMailerTest < ActionMailer::TestCase
  test "confirm_or_no" do
    mail = QuoteSubmissionMailer.confirm_or_no
    assert_equal "Confirm or no", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
