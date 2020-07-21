class CaseInboxMailbox < ApplicationMailbox
  before_processing :find_case
  def process
    @kase.messages.create(body: mail.body.raw_source, direction: :in)
  end

  private

  def find_case
    @kase = Admin::Case.find_by(token: extract_token(mail))
  end

  def extract_token(msg)
    recipients = mail.to

    # the username value of the first email address
    recipients.first.split('@').first
  end
end
