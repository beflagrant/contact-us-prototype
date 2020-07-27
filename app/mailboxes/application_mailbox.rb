class ApplicationMailbox < ActionMailbox::Base
  routing (/mailgun/i) => :case_inbox
end
