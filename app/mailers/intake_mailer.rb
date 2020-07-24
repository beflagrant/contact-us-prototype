class IntakeMailer < ApplicationMailer
  def triage_email
    @intake = params[:intake]
    @url = admin_case_url(@intake.case)
    mail(
      to: ENV.fetch('TRIAGE_EMAIL'),
      subject: "New Intake Submitted"
    )
  end
end
