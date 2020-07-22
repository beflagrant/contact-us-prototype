class Admin::CaseMessageMailer < ApplicationMailer

  def message_email
    @kase = params[:admin_case]
    @message = params[:message]
    mail(
      to: @kase.intake.email,
      from: "#{@kase.token}@example.com",
    )
  end
end
