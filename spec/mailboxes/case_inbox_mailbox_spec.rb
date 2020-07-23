require 'rails_helper'

RSpec.describe CaseInboxMailbox, type: :mailbox do
  let(:email) { 'from-address@example.com' }
  let(:intake) { create :intake, email: email }
  let(:admin_case) { create :admin_case, intake: intake }
  let(:other_case) { create :admin_case }

  context 'from an email address with an active case' do
    context 'to a case address matching their case token' do
      subject do
        receive_inbound_email_from_mail(
          from: email,
          to: "#{admin_case.token}@example.com",
          subject: 'test case',
          body: 'this is a message from the client'
        )
      end

      it do
        expect { subject }.to change(Admin::Message, :count).by(1)
      end
    end

    context 'to a case address not matching their case' do
      subject do
        receive_inbound_email_from_mail(
          from: 'from-address@example.com',
          to: "#{other_case.token}@example.com",
          subject: 'test case',
          body: "this is a message from a scammer"
        )
      end

      it do
        expect { subject }.not_to change(Admin::Message, :count)
      end
    end
  end
end
