class CaseInboxMailbox < ApplicationMailbox
  before_processing :find_case
  def process
    return unless @kase
    @kase.messages.create(body: mail.body.raw_source, direction: :in)
  end

  private

  def find_case
    intake_ids = Intake.where(email: mail.from.first).map(&:id)
    @kase = Admin::Case.find_by(token: extract_token(mail), intake_id: intake_ids)
  end

  def extract_token(msg)
    recipients = mail.to

    # the username value of the first email address
    recipients.first.split('@').first
  end
end
