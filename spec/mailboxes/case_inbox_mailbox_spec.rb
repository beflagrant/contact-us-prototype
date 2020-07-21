require 'rails_helper'

RSpec.describe CaseInboxMailbox, type: :mailbox do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:admin_case) { create :admin_case }

  subject do
    receive_inbound_email_from_mail(
      from: 'from-address@example.com',
      to: "#{admin_case.token}@example.com",
      subject: 'test case',
      body: "this is a message from the client"
    )
  end

  it do
    expect { subject }.to change(Admin::Message, :count).by(1)
  end
end
